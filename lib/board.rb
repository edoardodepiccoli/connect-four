class Board 
  attr_accessor :board_array

  def initialize
    @board_array = [
      "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
      "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
      "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
      "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
      "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
      "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
    ]
  end

  def display_board
    string = ""
    @board_array.each_with_index do |item, index| 
      if index % 7 == 0 && index != 0
        string += "\n" + item
      else
        string += item
      end
    end
    puts string
  end

  def get_move_index(column)
    current_row = 0

    while @board_array[current_row * 7 + column] == "⚫️"
      current_row += 1
    end

    (current_row - 1) * 7 + column
  end

  def move_index_valid?(index) 
    return true if @board_array[index] == "⚫️" && index.between?(0, 7 * 6)
    return false
  end

  def move_valid?(column)
    move_index_valid?(get_move_index(column))
  end

  def make_move(index, player_symbol)
    @board_array[index] = player_symbol
  end

  def finished?
    return true unless @board_array.include?("⚫️")
    rows = 6
    cols = 7

    # horizontal winner
    (0...rows).each do |r|
      (0...(cols - 3)).each do |c|
        if board_array[r * cols + c] == board_array[r * cols + c + 1] &&
           board_array[r * cols + c] == board_array[r * cols + c + 2] &&
           board_array[r * cols + c] == board_array[r * cols + c + 3] &&
           board_array[r * cols + c] != "⚫️"
          return true
        end
      end
    end

    # vertical winner
    (0...(rows - 3)).each do |r|
      (0...cols).each do |c|
        if board_array[r * cols + c] == board_array[(r + 1) * cols + c] &&
           board_array[r * cols + c] == board_array[(r + 2) * cols + c] &&
           board_array[r * cols + c] == board_array[(r + 3) * cols + c] &&
           board_array[r * cols + c] != "⚫️"
          return true
        end
      end
    end

    # diagonal winner from top left to bottom right
    (0...(rows - 3)).each do |r|
      (0...(cols - 3)).each do |c|
        if board_array[r * cols + c] == board_array[(r + 1) * cols + c + 1] &&
           board_array[r * cols + c] == board_array[(r + 2) * cols + c + 2] &&
           board_array[r * cols + c] == board_array[(r + 3) * cols + c + 3] &&
           board_array[r * cols + c] != "⚫️"
          return true
        end
      end
    end

    # diagonal winner bottom left to top right
    (3...rows).each do |r|
      (0...(cols - 3)).each do |c|
        if board_array[r * cols + c] == board_array[(r - 1) * cols + c + 1] &&
           board_array[r * cols + c] == board_array[(r - 2) * cols + c + 2] &&
           board_array[r * cols + c] == board_array[(r - 3) * cols + c + 3] &&
           board_array[r * cols + c] != "⚫️"
          return true
        end
      end
    end

    # no winner
    false
  end
end