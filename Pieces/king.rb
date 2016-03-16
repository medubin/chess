require_relative 'jump.rb'
require_relative 'piece.rb'
class King < Piece
  include Jump

  def move_dirs
    [
      [ 1, 1],
      [ 1, 0],
      [ 1,-1],
      [-1,-1],
      [ 0,-1],
      [-1, 1],
      [ 0, 1],
      [-1, 0]
    ]
  end


  def castling
    ### TO IMPLEMENT LATER
    # castle_moves = []
    # unless @moved
    #   if @board[@pos[0] - 4, @pos[1]].class == Rook && !@board[@pos[0] - 4, @pos[1]].moved &&

  end

  def initialize(pos, color, board)
    super(pos, color, board)
    (@icon = '♚')
  end

end
