require 'sinatra/base'

class NoughtsAndCrosses < Sinatra::Base
  get '/' do
    'Hello NoughtsAndCrosses!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
