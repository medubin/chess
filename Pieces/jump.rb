require_relative 'piece.rb'
module Jump

  def possible_moves
    move_dirs.map do |el|
      [el[0] + @pos[0], el[1] + @pos[1]] unless !(el[0] + @pos[0]).between?(0,7) ||
       !(el[1] + @pos[1]).between?(0,7) ||
       @board[[el[0] + @pos[0], el[1] + @pos[1]]].color == @color
    end
  end
end
