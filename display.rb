require "colorize"
require_relative 'cursorable.rb'


class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @all_moves = []
  end

  def build_grid
    @all_moves =  @board[@cursor_pos].all_moves
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)

    row.map.with_index do |piece, j|
      color_options = colors_for(i,j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)

    if [i,j] == @cursor_pos
      bg = :light_green
   elsif @all_moves.include?([i,j]) || @board.all_moves.include?([i,j])
     bg = :yellow
    elsif (i + j).odd?
      bg = :black
    else
      bg = :blue
    end
    if(@board[[i,j]]).white?
      fg = :white
    else
      fg = :red
    end
    { background: bg, color: fg }
  end

  def render
    system("clear")
    puts "It is #{@board.current_player.to_s}'s turn!"
    puts "Arrow keys to move, space or enter to select position."
    build_grid.each { |row| puts row.join }
  end
end
