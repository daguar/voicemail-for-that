# voicemail-for-that

Anthropomorphizing inanimate objects by providing them a voicemail that people can call.

## Setup

To use the app, you'll need a welcome voicemail file, a server (or something like Heroku) to run the Rails app, and a Twilio account.

### The Welcome Voicemail File

Record a voice file in the persona of the inanimate object you're providing a voicemail for. Make sure you mention two things:

1. Press 1 to leave a message
2. Press 2 to listen to messages

For example:

_Hey, this is the Albany Bulb, and you've got my voicemail. Press 1 to leave a message or press 2 to listen to messages._

Save this voice file as `prompt.mp3` and replace the file by that name in `app/assets/audio/` (add this to git with `git add .` and then commit it with `git commit`.)

### Server/Rails App Setup

Next you'll need to set up somewhere for this app (written in Ruby on Rails) to run. It needs an ActiveRecord database, with Postgres preferred.

Here are example instructions for Heroku.

```bash
heroku create your-app-name-here
git push heroku master
heroku run rake db:migrate
```

### Twilio Setup

This app runs on the excellent [Twilio](https://www.twilio.com/) telephony API service.

Here are the steps to set up Twilio:

1. Buy a phone number
2. Set the Voice Request URL for your phone number (found on Twilio's site at Account > Numbers, then clicking your phone number.) You want to set the Request URL to your application's URL with `/prompt` at the end. For example: `http://my-app-name.herokuapp.com/prompt`. Be sure to select 'GET'.

#### Twilio Cost Note

Remember, Twilio is a service which costs money! It's pretty cheap ($1/month per phone number, 1 cent per call minute) but it could add up. It's up to you to make sure you're not losing tons of money.

### Leaving The First Message

Lastly, you should call in and press '1' at the prompt, and leave the first message. (This is because if the first person to call in tries to listen to messages and there are none yet, they will get an error.)

It's also a good idea to use this to set the tone you want the conversation to have (jovial? serious? political?)

## Questions

Hit me up on Twitter at [@allafarce](https://twitter.com/allafarce)

Copyright 2014 Dave Guarino, MIT License
