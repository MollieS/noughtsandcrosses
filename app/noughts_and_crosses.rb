require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/computer.rb'
require_relative '../lib/game.rb'

class NoughtsAndCrosses < Sinatra::Base
  register Sinatra::Flash

  set :views, proc { File.join(root, '..', 'views') }
  set :public_dir, proc { File.join(root, '..', 'public') }

  games = {}

  get '/' do
    erb :index
  end

  post '/game/new' do
    if params[:players] == 'two_humans'
      player = Player.new(params[:symbol])
      params[:symbol] == 'X' ? opponent = Player.new('O') : opponent = Player.new('X')
    elsif params[:players] == 'on'
      player = Player.new(params[:symbol])
      params[:symbol] == 'X' ? opponent = Computer.new('O') : opponent = Computer.new('X')
    else
      player = Computer.new('X')
      opponent = Computer.new('O')
    end
    game = Game.new(player, opponent, Board.new)
    params[:first_player] == 'player1' ? game.first_player = player : game.first_player = opponent
    games[:game] = game
    redirect('/play')
  end

  get '/play' do
    @game = games[:game]
    until !@game.current_player.respond_to?(:move) || @game.over?
      @game.play(@game.current_player.move(@game))
    end
    flash.now[:notice] = "Winner: #{@game.winner.symbol}" if @game.winner
    flash.now[:notice] = "It's a tie!" if @game.result == 'tie'
    flash.now[:notice] = "#{@game.current_player.symbol} to play" unless @game.over?
    erb :play
  end

  post '/board/update' do
    game = games[:game]
    location =  params[:location]
    game.play(location.to_i)
    if game.current_player.respond_to? :move
      computer_move = game.current_player.move(game)
      game.play(computer_move)
    end
    redirect('/play')
  end

  post '/play/new' do
    game = games[:game]
    game.reset
    redirect('/play')
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
