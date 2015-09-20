require 'sinatra/base'
require 'pry'

class RPSDemo < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
   enable :sessions
   set :session_secret, '123454321'
   use Rack::Session::Pool
   
  get '/' do
    'Hello RPSDemo!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
