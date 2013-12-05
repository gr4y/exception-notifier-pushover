# ExceptionNotifier::Pushover

[![Build Status](https://travis-ci.org/gr4y/exception-notifier-pushover.png)](https://travis-ci.org/gr4y/exception-notifier-pushover)
[![Dependency Status](https://gemnasium.com/gr4y/exception-notifier-pushover.png)](https://gemnasium.com/gr4y/exception-notifier-pushover)

ExceptionNotifier::Pushover adds [pushover](http://pushover.net) notifier to exception_notification in your rails app.

## Usage

First you have to install the [exception_notification](https://github.com/smartinez87/exception_notification) gem in your rails application. If you have done that you have to configure the pushover notifier in your `config/initializers/exception_notification.rb`

Configuring the pushover_notifier

    Whatever::Application.config.middleware.use ExceptionNotification::Rack,
      # --- your notifiers here (email, campfire, etc...) ---
      :pushover => {
        # You have to configure the URL to the pushover api.
        :url => "https://api.pushover.net/1/messages.json",
        # Insert the user tokens of all developers that need to be notified here
        :users => ["218zegf9qhg12gfqgr317zg9"],
        # Insert your api_token of your registered app
        :api_token => ENV["PUSHOVER_API_TOKEN"]
      }

**All three options are required!** Yes, you have to configure the url to the pushover API!

And please don't forget to require the pushover_notifier at the top of your initializer:

    require "exception_notifier/pushover_notifier" 

I recommend raising an Exception somewhere in your controllers, to see if you configured it correctly.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
