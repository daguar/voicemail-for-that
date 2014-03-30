require 'spec_helper'

describe Voicemail do
  describe '#random' do
    before do
      voicemail_array = []
      3.times { voicemail_array << create(:voicemail) }
      @voicemail_ids = voicemail_array.map { |vm| vm.id }
    end

    it 'retrieves a valid voicemail' do
      random_vm = Voicemail.random
      expect(@voicemail_ids).to include(random_vm.id)
    end
  end
end
