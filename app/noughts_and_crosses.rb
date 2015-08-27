require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/computer.rb'
require_relative './helpers/computer_moves.rb'
require_relative './helpers/playing_game.rb'
require_relative './helpers/game_setup.rb'

class NoughtsAndCrosses < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers ComputerMoves, Playing, Setup

  set :views, proc { File.join(root, '..', 'views') }
  set :public_dir, proc { File.join(root, '..', 'public') }

  get '/' do
    erb :index
  end

  post '/game/new' do
    session[:game] = two_player_game if params[:players] == 'two_humans'
    session[:game] = human_computer_game if params[:players] == 'on'
    redirect('/play')
  end

  get '/play' do
    @board = session[:game]
    computer_move if computer_first?
    flash.now[:notice] = "Winner: #{@board.winner}" if @board.won_by?(@board.opponent.symbol) || @board.won_by?(@board.player.symbol)
    flash.now[:notice] = "It's a tie!" if @board.tie?
    erb :play
  end

  post '/board/update' do
    @board = session[:game]
    make_move
    computer_move if @board.current_player.class == Computer
    reset_board
    redirect('/play')
  end

  post '/play/new' do
    session[:game] = Board.new(session[:game].player, session[:game].opponent)
    redirect('/play')
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
