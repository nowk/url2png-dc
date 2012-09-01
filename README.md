#Url2Png-dc

---

Url2Png-dc is a gem rewritten for the new /v6/ api version of the popular screenshot service [URL2PNG](http://url2png.com).

Includes URL Helpers for:

* Basic (default) image retrieval `beta.url2png.com/.../png/?...`
* Retrieving the new JSON playload `beta.url2png.com/.../json/?...`
* And a special method to retrieve the "Cache" URL*

\* Outlook was not rendering screenshots using the standard API call for image retrieval.


##Install

    gem install url2png-dc

Or add to Gemfile

    gem 'url2png-dc',  :require => 'url2png_dc'

You may always require later, as you see fit.


##Configure

Maybe in an initalizer file or something. These will be the become the standard defaults, if you do not provide additional options.

    Url2PngDc.configure do |config|
      config.url2png_apikey      = ENV['URL2PNG_APIKEY']
      config.url2png_secret      = ENV['URL2PNG_SECRET']
      # config.viewport_dimensions = '1280x1024'
      # config.fullpage            = true
      # config.force_refresh       = true
    end

*Currently this gem only supports the /v6/ API.  You can take a look at [https://github.com/robinhoudmeyers/url2png-gem](https://github.com/robinhoudmeyers/url2png-gem) if you need support for the older API versions (Also includes HTML tag creation and support for v6).*


##Usage

*__Currently all the helpers are just URL generators. HTML tag building is not included.__*

You will have to `require` (maybe, depending on how you set this up) and `include Url2PngDc::UrlHelpers`. That will give you access to 3 methods.

Generate the basic URL2PNG url

    url_2png "http://twitter.com"

Generate the JSON playload url

    url_2json "http://twitter.com"

Generate and `get` the cache url

    url_2cache "http://twitter.com"

`url_2cache` will make a request out to the JSON payload url and parse the `png` key in order to get the cached url. So this could take a moment, if you are doing things in real-time.

The cache url (to my knowledge) is removed on a 30 day basis. 

If anytime the request or the parsing of the payload fails, it defers to the `url_2png` method and returns the basic API url instead.


__Each method can take a 2nd Hash `{}` option to override some of the default options for URL generation__


    url_2png "http://twitter.com", {:fullpage => false, ...}


You can reference [URL2PNG's documentation](http://url2png.com/docs/) for the available options.



*\*Standard Rails hooks, so you can just plug and play, will be added shortly. But, if you want to get a jump on things, you can view the `quick_start` branch, that does a basic include into the view helpers. __At this point, I've only tested this on Rails 3.__ But there will be a larger range of support once the Rails hooks are written.*


##Fork it!

After you've done that just run `rake` for the tests or

    rake test

I have an actually "live" test that will make an actual call out to URL2PNG. *You will need to add your credentials in order to get a screenshot.*

    export URL2PNG_APIKEY = 'PXXXXX'
    export URL2PNG_SECRET = 'SXXXXX'

Some where Ruby can find it. 

Then you can run it with 

    rake test:rl



## Copyright

Copyright (c) 2012 Yung Hwa Kwon. See [MIT-LICENSE](https://github.com/nowk/url2png-dc/blob/master/MIT-LICENSE) for details.
    

---

__PS__ If my spelling and/or grammar is incorrect anywhere, I'm sorry. =)
