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
      before do
        make_request({'Digits' => '2'})
      end

      it 'redirects to listening to voicemails' do
        expect(response.body).to redirect_twilio_to(random_voicemail_path)
      end
    end
  end

  describe 'GET /voicemail/random' do
    before { get :random }

    it 'is successful' do
      expect(response).to be_successful
    end
  end

  describe 'GET /voicemail/new' do
    before { get :new }

    let(:response_hash) { Hash.from_xml(response.body) }

    let(:record_hash) { response_hash['Response']['Record'] }

    it 'is successful' do
      expect(response).to be_successful
    end

    it "says 'leave a message after the beep'" do
      words_said_by_robot = response_hash['Response']['Say']
      expect(words_said_by_robot).to eq('Leave a voice message after the beep. Press one when you are done recording.')
    end

    it 'records voice input' do
      expect(response_hash['Response']).to have_key('Record')
    end

    describe 'recording option set' do
      it 'issues a POST' do
        expect(record_hash['method']).to eq('POST')
      end

      it 'sends to the voicemail creation URL' do
        expect(record_hash['action']).to eq('/voicemail')
      end

      it 'times out after one minute' do
        expect(record_hash['maxLength']).to eq('60')
      end

      it 'plays beep (default Twilio behavior)' do
        expect(record_hash).not_to have_key('playBeep')
      end

      it 'finishes on the pressing of any key (default Twilio behavior)' do
        expect(record_hash).not_to have_key('finishOnKey')
      end
    end
  end

  describe 'POST /voicemail/create' do
    # Save recording, say "message saved. playing back other voicemail"
    before { post :create }

    it 'is successful' do
      expect(response).to be_successful
    end
  end
end
