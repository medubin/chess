require 'byebug'
class Piece
  attr_reader :color, :icon
  attr_accessor :pos, :moved
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
    @moved = false
  end

  def to_s
    " #{@icon} "
  end

  def nil?
    false
  end

  def die
    @board[@pos] = nil #add nil piece
    @pos = nil
  end

  def white?
    @color == :white
  end

  def black?
    @color == :black
  end

  def all_moves
    valid_moves(possible_moves)
  end

  def valid_moves(move_set)
    move_set.select { |move| valid_move?(move) }
  end

  def valid_move?(new_pos)
    return false if new_pos.nil?
    return false unless new_pos[0].between?(0,7) && new_pos[1].between?(0,7)
    return false if @board[new_pos].color == @color
    return false if color != @board.current_player
    return false if !@board.new_game_state_check?(@pos, new_pos, @color)
    # possible_moves.any? do |el|
    #   new_pos == el
    # end
    true
  end


  def dup(board)
    self.class.new(@pos.dup, @color, board)
  end

end
