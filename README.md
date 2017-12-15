# GoogleDriveHandler

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/google_drive_handler`. To experiment with that code, run `bin/console` for an interactive prompt.

This gem helps you to create and save different credentials and scope setup using dot environment to setup the scopes and the credentials folders.
By default is ~/.credentials/


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_drive_handler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_drive_handler

## Usage

To create the credentials the first time, you need to save in the credetital directory the client_secret.json. You have to create a project and enable apis Google Drive, Sheets, Google+ and then create a credentials and download the client_secret.json
By default the value is ~/.credentials/client_secret.json
But you could overwrite using the envirnoment variable CLIENT_SECRET_PATH in the .env file.

The command google_drive_auth is to help you to save the credentials. You can generate the credential for your scopes, running the command.
You will get a url to authorize and get the autorization code. Paste in the terminal to save the credentials for the selected scopes.



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/google_drive_handler. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the GoogleDriveHandler project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/google_drive_handler/blob/master/CODE_OF_CONDUCT.md).
