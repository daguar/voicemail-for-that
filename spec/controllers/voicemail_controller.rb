require 'spec_helper'

describe VoicemailController do
  describe 'GET #prompt' do
    def make_request
      get :prompt
    end

    before { make_request }

    it 'is successful' do
      expect(response).to be_successful
    end
  end
end
