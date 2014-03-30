xml.instruct!
xml.Response do
  if params['Digits'] == '1'
    xml.Redirect new_voicemail_path
  elsif params['Digits'] == '2'
    xml.Redirect '/voicemails/random'
  else
    xml.Redirect '/prompt'
  end
end
