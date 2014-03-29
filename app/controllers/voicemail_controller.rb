class VoicemailController < ApplicationController
  def prompt
    render action: 'prompt.xml.builder', layout: false
  end
end
