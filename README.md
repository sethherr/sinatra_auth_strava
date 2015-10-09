### A [Sinatra](http://www.sinatrarb.com/) template for [Grape-Doorkeep applications](https://github.com/sethherr/grape-doorkeeper)

This is a template application to build mini websites authenticated with OAuth2, such as [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) provides.

## Using it:

1. Fork or clone this repository
2. Update the values in [.env](.env) with your values
3. Go to the directory this is contained in the terminal
4. Use `rerun rackup` to start the server 
5. The above command will print out something like `WEBrick::HTTPServer#start: pid=62447 port=9292`. Go to localhost:{that_port_number} - e.g. [http://localhost:9292](http://localhost:9292). 
6. Go there to the above url to see the app! :sparkles:

## Directories / files

*The directory structure of this app is set up to loosely resemble rails*

- `assets`
  - javascript, coffeescript, css, scss - compiled, minified, concatenated.
- `views`
  - haml, erb or html files. `layout.haml` is the layout file that wraps everything else up.
- `public` 
  - files in here are served directly from the base url
- `config/routes.rb`
  - the routes for the app


## Rails Assets

This template includes [rails-assets](https://rails-assets.org/), which makes it easy to use [bower](http://bower.io/) packages.

Add bower packages to the Gemfile by putting them in the Bower packages block in this format:

    gem 'rails-assets-BOWER_PACKAGE_NAME'`.

*Since Javascript packages change quickly, it's a good idea to lock the packages with a loose version after you `bundle install`. So for the jQuery version currently installed, that's `gem 'rails-assets-jquery', '~> 2.1.4'` (which means >= 2.1.4 and < 2.2.0).*

You can then safely update your packages with `bundle update`

**View [the list of bower packages](http://bower.io/search/)** 