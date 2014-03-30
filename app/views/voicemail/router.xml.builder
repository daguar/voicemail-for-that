xml.instruct!
xml.Response do
  if params["Digits"] == '1'
    xml.Redirect new_voicemail_path
  else
    xml.Redirect '/prompt'
  end
end
