require 'sinatra/base'
require 'pry'
require './lib/rps.rb'

class RPSDemo < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
   enable :sessions
   set :session_secret, '123454321'
   use Rack::Session::Pool
   
  get '/' do
    erb :index
  end
  
  post '/play_game' do
    if params[:name] == '' || params[:name] == nil
      redirect '/'
    else
      session[:name] = params[:name]
      @player_name = session[:name]
      erb :play_game
    end
  end
  
  post '/results' do
    @results = RPS.play(params[:move])
    erb :results
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
