# Rock Paper Scissord Demo

Makers Academy weekend challenge for week 3

####Step-by-step
create application folder:
```
mkdir my_app
```
cd into that folder...


Run: 
```
rspec-sinatra init --app  MyApp lib/my_app.rb
```
Run:
```
rspec --init
``` 
also, edit the `.rspec` file and add `--format documentation` to see a more verbose rspec output. 
Greate a Gemfile: `touch Gemfile` and add some basic ligaries you will be using: 
```
source 'https://rubygems.org'

gem 'sinatra'

group :development, :test do
  gem 'capybara'
  gem 'launchy'
  gem 'rspec'
  gem 'rspec-sinatra'
  gem 'shotgun'
end
```
add `gem ‘rack-test’ to your Gemfile and require it in your `spec_helper`, Also add `config.include Rack::Test::Methods` to your Rspec.configure block.
create a `features` folder in `spec` 
```
mkdir spec/features
``` 
create a `my_app_spec.rb` in the `features` folder. 
Add your first test:
```
In order to get the assets to load, add:
```
use Rack::Static, urls: ['/css', '/js', '/images', '/fonts'], root: 'assets'
```
And create the folders. Also, you are gonna need a layout file in your `views`folder
