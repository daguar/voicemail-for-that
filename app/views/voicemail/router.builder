if params['Digits'] == '1'
  xml.Redirect(new_voicemail_path, method: 'GET')
elsif params['Digits'] == '2'
  xml.Redirect(random_voicemail_path, method: 'GET')
else
  xml.Redirect('/prompt', method: 'GET')
end
