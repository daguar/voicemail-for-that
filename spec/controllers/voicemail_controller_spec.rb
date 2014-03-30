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

  describe 'POST #route' do
    # context 'no digits entered'
    # => redirect back to prompt

    # context 'user pressed 1'
    # => redirect to leaving a voicemail

    # context 'user pressed 2'
    # => redirect to voicemail playback
  end
end
