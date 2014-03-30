require 'spec_helper'
require 'nokogiri'

describe VoicemailController do
  render_views

  describe 'GET #prompt' do
    before { get :prompt }

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'plays the voice prompt stored in assets' do
      expect(response.body).to play_twilio_url(/assets\/prompt.mp3/)
    end

    describe 'gather' do
      let(:gather_hash) {
        response_hash = Hash.from_xml(response.body)
        gather_hash = response_hash['Response']['Gather']
        gather_hash
      }

      it 'sends user input to /route' do
        expect(gather_hash['action']).to eq('/route')
      end

      it 'times out after 5 seconds' do
        expect(gather_hash['timeout']).to eq('5')
      end

      it 'accepts a single digit of user input' do
        expect(gather_hash['numDigits']).to eq('1')
      end

      it 'does not finish on a specific key' do
        expect(gather_hash['finishOnKey']).to eq('')
      end
    end
  end

  describe 'POST #router' do
    def make_request(params = {})
      post :router, params
    end

    context 'no digits entered' do
      before { make_request }

      it 'redirects to prompt' do
        expect(response.body).to redirect_twilio_to('/prompt')
      end
    end

    context 'user pressed 1' do
      before do
        make_request({'Digits' => '1'})
      end

      it 'redirects to leaving a voicemail' do
        expect(response.body).to redirect_twilio_to(new_voicemail_path)
      end
    end

    context 'user pressed 2' do
    # => redirect to voicemail playback
      before do
        make_request({'Digits' => '2'})
      end

      it 'redirects to listening to voicemails' do
        expect(response.body).to redirect_twilio_to(voicemails_path)
      end
    end
  end
end
