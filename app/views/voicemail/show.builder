xml.Play @voicemail.url
xml.Say 'End of message. Playing another message.'
xml.Redirect(random_voicemail_path, method: 'GET')
