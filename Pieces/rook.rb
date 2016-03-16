require_relative "piece.rb"
require_relative "slide.rb"

class Rook < Piece
  include Slide

  def initialize(pos, color, board)
    super(pos, color, board)
    (@icon = '♜')
  end

  def possible_moves
    orthogonal_moves
  end

end
