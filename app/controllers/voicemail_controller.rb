class VoicemailController < ApplicationController
  def prompt
    render action: 'prompt.xml.builder', layout: false
  end

  def router
    render action: 'router.xml.builder', layout: false
  end

  def new
  end

  def random
    render action: 'random.xml.builder', layout: false
  end
end
