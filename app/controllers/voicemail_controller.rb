class VoicemailController < ApplicationController
  def prompt
    render action: 'prompt.xml.builder', layout: false
  end

  def router
    render action: 'router.xml.builder', layout: false
  end

  def new
    render action: 'new.xml.builder', layout: false
  end

  def create
    render action: 'create.xml.builder', layout: false
  end

  def random
    render action: 'random.xml.builder', layout: false
  end
end
