require_relative "all_pieces.rb"
require_relative 'display.rb'

class Board
  attr_reader :grid, :display
  attr_accessor :current_player, :all_moves

  def initialize(start = true)
    @grid = Array.new(8) {Array.new(8)}
    @display = Display.new(self)
    populate if start
    @all_moves = []
  end


  def dup
    new_board = Board.new(false)
    8.times do |row|
      8.times do |col|
        new_board[[row, col]] = self[[row, col]].dup(new_board)
      end
    end

    new_board
  end


  def populate
    all_pieces = make_black_team + make_nil + make_white_team
    @grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        self[[i,j]] = all_pieces.shift
      end
    end
  end

  def move(start_pos, end_pos)
    if @all_moves.include?(end_pos)
      self[end_pos].die
      self[end_pos] = self[start_pos]
      self[start_pos] = NilPiece.new(start_pos, nil, self)
      self[end_pos].pos = end_pos
      self[end_pos].moved = true
      pawn_promototion(end_pos)
      @all_moves = []
      return true
    else
      @all_moves = []
      return false
    end
  end

  def pawn_promototion(end_pos)
    if self[end_pos].class == Pawn && [0,7].include?(end_pos[0])
      pawn_color = self[end_pos].color
      self[end_pos].die
      self[end_pos] = Queen.new(end_pos, pawn_color, self)
    end
  end

  def force_move(start_pos, end_pos)
    self[end_pos].die
    self[end_pos] = self[start_pos]
    self[start_pos] = NilPiece.new(start_pos, nil, self)
    self[end_pos].pos = end_pos
    self[end_pos].moved = true
    pawn_promototion(end_pos)
  end


  def new_game_state_check?(start_pos, end_pos, color)
    color == :white ? alt_player = :black : alt_player = :white
    potential_board = self.dup
    potential_board.force_move(start_pos, end_pos)
    !potential_board.check?(alt_player)
  end


  def check?(attack_color)
    king_pos = []
    possible_checks = []
    8.times do |row|
      8.times do |col|
        if self[[row,col]].color == attack_color
          possible_checks += self[[row,col]].possible_moves
        elsif self[[row,col]].is_a?(King)
          king_pos = [row,col]
        end
      end
    end
    possible_checks.include?(king_pos)
  end

  def checkmate?(attack_color)
    8.times do |row|
      8.times do |col|
        if self[[row,col]].color == attack_color
          return false if !(self[[row,col]].all_moves.empty?)
        end
      end
    end
    true
  end

  def [] pos
    row,col = pos
    @grid[row][col]
  end

  def []= pos, value
    row,col = pos
    @grid[row][col] = value
  end

  private

  def make_black_team
    [
      Rook.new([0,0], :black, self),
      Knight.new([0,1], :black, self),
      Bishop.new([0,2], :black, self),
      Queen.new([0,3], :black, self),
      King.new([0,4], :black, self),
      Bishop.new([0,5], :black, self),
      Knight.new([0,6], :black, self),
      Rook.new([0,7], :black, self),
      Pawn.new([1,0], :black, self),
      Pawn.new([1,1], :black, self),
      Pawn.new([1,2], :black, self),
      Pawn.new([1,3], :black, self),
      Pawn.new([1,4], :black, self),
      Pawn.new([1,5], :black, self),
      Pawn.new([1,6], :black, self),
      Pawn.new([1,7], :black, self)
    ]
  end

  def make_white_team
    [
      Pawn.new([6,0], :white, self),
      Pawn.new([6,1], :white, self),
      Pawn.new([6,2], :white, self),
      Pawn.new([6,3], :white, self),
      Pawn.new([6,4], :white, self),
      Pawn.new([6,5], :white, self),
      Pawn.new([6,6], :white, self),
      Pawn.new([6,7], :white, self),
      Rook.new([7,0], :white, self),
      Knight.new([7,1], :white, self),
      Bishop.new([7,2], :white, self),
      Queen.new([7,3], :white, self),
      King.new([7,4], :white, self),
      Bishop.new([7,5], :white, self),
      Knight.new([7,6], :white, self),
      Rook.new([7,7], :white, self)
    ]
  end

  def make_nil
    blank_spaces = []
    4.times do |row|
      8.times do |col|
        blank_spaces << NilPiece.new([(row + 2),col], nil, self)
      end
    end
    blank_spaces
  end



end
