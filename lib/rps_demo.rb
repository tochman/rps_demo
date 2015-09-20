require 'sinatra/base'
require 'pry'

class RPSDemo < Sinatra::Base
  get '/' do
    'Hello RPSDemo!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
