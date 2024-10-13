require_relative "board"

class Game
  attr_reader :turn

	def initialize()
		@board = Board.new
    @turn = 0
	end

  def switch_turn
    @turn = @turn == 0 ? 1 : 0
  end

  def play
    until @board.finished?
      @board.display_board
      get_player_move
      switch_turn
    end

    @board.display_board
    puts "finished!"
  end

	def get_player_move
    player_input = gets.chomp
    until player_input.match?(/\d/) && @board.move_valid?(player_input.to_i)
      puts "invalid"
      player_input = gets.chomp
    end
    if @turn == 0
      @board.make_move(@board.get_move_index(player_input.to_i), "🔴")
    else
      @board.make_move(@board.get_move_index(player_input.to_i), "🔵")
    end
  end
end