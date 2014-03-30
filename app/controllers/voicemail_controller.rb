class VoicemailController < ApplicationController
  layout 'twilio_xml'

  def prompt
  end

  def router
  end

  def new
  end

  def create
    if params['RecordingDuration'].to_i > 2
      @vm_saved = Voicemail.create(url: params['RecordingUrl'])
    end
  end

  def random
  end
end
