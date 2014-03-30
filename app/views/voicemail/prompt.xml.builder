xml.instruct!
xml.Response do
  xml.Gather action: '/route', timeout: 5, numDigits: 1, finishOnKey: '' do
    xml.Play asset_url('prompt.mp3')
  end
end
