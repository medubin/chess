require_relative "piece.rb"

class NilPiece < Piece
  def initialize(pos, color, board)
    super(pos, nil, board)
    @icon = nil
  end

  def valid_move?(new_pos)
    false
  end

  def possible_moves
    return []
  end


  def nil?
    true
  end

  def to_s
    "   "
  end

  # def object_id
  #   "x"
  # end

end
