require_relative 'human_player.rb'
require_relative 'board.rb'

class Chess
  attr_accessor :board, :current_player
  def initialize
    @black_player = HumanPlayer.new(:black, self)
    @white_player = HumanPlayer.new(:white, self)
    @current_player = @white_player
    @board = Board.new
    @board.current_player = @white_player.color
    @board.populate
    @board.display.render
  end

  def switch_players
    if @current_player.color == :white
      @board.current_player = @black_player.color
      @current_player = @black_player
    else
      @current_player = @white_player
      @board.current_player = @white_player.color
    end
  end

  def play
    while !@board.checkmate?(@current_player.color)
      start_pos = @current_player.take_turn
      @board.all_moves = @board[start_pos].all_moves if start_pos
      if @board[start_pos].all_moves.length > 0
        end_pos = @current_player.take_turn
      else
        start_pos = nil
        next
      end

      if @board.move(start_pos, end_pos)
        switch_players
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  chess = Chess.new
  chess.play
end
