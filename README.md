# Sinatra Application Demo

Steps needed to set up a basic Sinatra application together with Rack Test and Capybara.

Go through those steps and remember to commit often in order to keep track of your progress in version control.

####A walk through:
Create application folder:
```
mkdir my_app
```
cd into that folder and initiate a new git repository wit `git init` 

In order to do set up your application run:
```
rspec-sinatra init --app  MyApp lib/my_app.rb
```
I usually also run:
```
rspec --init
``` 
or manually create the `.rspec`-file that I edit in order to add `--format documentation` to see a more verbose rspec output. 

If you have trouble running the above commands you need to install these gems from your terminal or add them to your Gemfile, run `bundle install` anr repeat those steps. 

Greate a Gemfile: `touch Gemfile` and add some basic libraries (gems) you will be using: 
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
Also make sure to add `gem ‘rack-test’` to your Gemfile and require it in your `spec_helper`. Don't forget to run `bundle install`.

Also add... 
```
config.include Rack::Test::Methods
```
...to your `Rspec.configure` block in `spec_helper`.

Create a `features` folder in `spec` 
```
mkdir spec/features
``` 
Create a `my_app_spec.rb` in the `features` folder. 

Add your first test:

```
feature 'application setup' do
  feature 'root path' do
    scenario 'is sucessfull' do
      visit '/'
      expect(page.status_code).to be 200
    end
  end
end 
``` 
We can also add another type of test just to try out another way of testing you controller: 
```
describe 'Root Path' do
  describe 'GET /' do
    before { get '/' } 
    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
end
``` 
Both tests are checking if the respose code for the root path is 200 but using different methods. 

####Assets
In order to get the assets to load, add:
```
use Rack::Static, urls: ['/css', '/js', '/images', '/fonts'], root: 'assets'
```
And create the folders - if you don't add any files to those folders at this stage, remember to at least create an empty `.keep` file in each folder to make git include it in version control. 

Also, you are gonna need a layout file in your `views` folder, so go ahead and create that file. 
