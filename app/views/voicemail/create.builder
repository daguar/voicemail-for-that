if @vm_saved
  xml.Say 'Message saved.'
  xml.Redirect('/prompt', method: 'GET')
else
  xml.Say "I'm sorry. That message was too short."
  xml.Redirect(new_voicemail_path, method: 'GET')
end
