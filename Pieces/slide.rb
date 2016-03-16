require_relative 'piece.rb'
module Slide

  def orthogonal_moves
    slide_moves(0,1) + slide_moves(0,-1) +
    slide_moves(-1,0) + slide_moves(1, 0)
  end

  def diagonal_moves
    slide_moves(1,1) + slide_moves(1,-1) +
    slide_moves(-1,1) + slide_moves(-1, -1)
  end





  private

  def slide_moves(x, y)
    slide_valid_moves = []
    1.upto(7) do |i|
      #returns an array of all moves a sliding piece can do, includes collision logic
      break unless (pos[0] + (i * x)).between?(0,7) && (pos[1] + (i * y)).between?(0,7)
      slide_valid_moves << [@pos[0] + (i * x), @pos[1] + (i * y)]
      if @board[[@pos[0] + (i * x), @pos[1] + (i * y)]].color == self.color
        slide_valid_moves.pop
        break
      elsif !@board[[@pos[0] + (i * x), @pos[1] + (i * y)]].color.nil?
        break
      end
    end
    slide_valid_moves
  end

end
