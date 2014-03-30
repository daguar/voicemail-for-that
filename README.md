# voicemail-for-that

Anthropomorphizing inanimate objects by providing them a voicemail that people can call.

## Usage

To use the app for your own purposes, you need a voice file, a server (or something like Heroku) to run the Rails app, and a Twilio account.

### Voice File

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

```


### Twilio Account



Copyright 2014 Dave Guarino
