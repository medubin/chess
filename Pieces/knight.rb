require_relative 'jump.rb'
require_relative 'piece.rb'

class Knight < Piece
  include Jump

  def move_dirs
    [
      [ 1, 2],
      [ 2, 1],
      [-1, 2],
      [ 2,-1],
      [ 1,-2],
      [-2, 1],
      [-1,-2],
      [-2,-1]
    ]
  end

  def initialize(pos, color, board)
    super(pos, color, board)
    (@icon = '♞')
  end

end
