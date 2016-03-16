require_relative "piece.rb"
require_relative "slide.rb"

class Bishop < Piece
  include Slide

  def initialize(pos, color, board)
    super(pos, color, board)
      (@icon = '♝')
  end

  def possible_moves
    diagonal_moves
  end


end
