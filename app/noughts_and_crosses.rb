require 'sinatra/base'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/computer.rb'

class NoughtsAndCrosses < Sinatra::Base

  enable :sessions

  set :views, Proc.new { File.join(root, '..', 'views') }
  set :public_dir, Proc.new { File.join(root, '..', 'public') }

  get '/' do
    erb :index
  end

  post '/game/new' do
    p params
    player = Player.new(params[:symbol])
    params[:first_player] == "player1" ? session[:game] = Board.new(player, set_opponent) : session[:game] = Board.new(set_opponent, player)
    p set_opponent
    redirect('/play')
  end

  get '/play' do
    @board = session[:game]
    if @board.current_player.class == Computer && first_go?
      @board.place_mark(@board.current_player.move(@board))
      @board.switch_turn
      session[:game] = @board
    end
    @board = session[:game]
    erb :play
  end

  post '/board/update' do
    @board = session[:game]
    @board.place_mark((params[:location]).to_i)
    @board.switch_turn
    if @board.current_player.class == Computer
      @board.place_mark(@board.current_player.move(@board))
      @board.switch_turn
    end
    session[:game] = @board
    redirect('/play')
  end

  def first_go?
    @board.grid == (0..8).to_a
  end

  def opponent_symbol
    params[:symbol] == "X" ? opponent_symbol = "O" : opponent_symbol = "X"
  end

  def set_opponent
    params[:players] == "two_humans" ? Player.new(opponent_symbol) : Computer.new(opponent_symbol)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
