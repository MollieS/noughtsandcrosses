module Playing
  def make_move
    @board.place_mark((params[:location]).to_i)
    @board.switch_turn
  end

  def first_go?
    @board.grid == (0..8).to_a
  end
end
