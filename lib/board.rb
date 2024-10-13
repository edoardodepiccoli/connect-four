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

  def get_move_index(column)
    current_row = 0

    while @board_array[current_row*7 + column] == "⚫️"
      current_row += 1
    end

    (current_row - 1)*7 + column
  end

  # make move should
  # - get the column
  # - get the precise baord index corresponding to the first free spot on the column starting from the bottom
  # which translates to checking the last free spot of the column starting from the top
  # should call a method to get that index
end