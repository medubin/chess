class HumanPlayer
  attr_reader :color

  def initialize(color, game)
    @color = color
    @game = game
  end

  def take_turn
    result = nil
    until result
      @game.board.display.render
      result = @game.board.display.get_input
    end
    result
  end


end
