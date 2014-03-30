class VoicemailController < ApplicationController
  def prompt
    render action: 'prompt.xml.builder', layout: false
  end

  def route
  end
end
