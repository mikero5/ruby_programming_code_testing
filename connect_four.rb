# 
# 
# 
# 
# 
# 
# 5| | | | | | | |
# 4| | | | | | | |
# 3| | | | | | | |
# 2| | | | | | | |
# 1| | | | | | | |
# 0| | | | | | | |
#   _____________
#   0 1 2 3 4 5 6
# 
# 

require_relative 'move.rb'
require_relative 'board.rb'
require_relative 'player.rb'



class ConnectFour
  attr_accessor :move_list
  attr_accessor :player_x
  attr_accessor :player_o
  attr_accessor :current_player
  
  def initialize
    @move_list      = []
    @player_x       = Player.new('X')
    @player_o       = Player.new('O')
    @current_player = @player_x
    @board          = Board.new
  end

  def play
    victor = nil
    move_array = @board.draw(@move_list)
    while !(victor = winner(move_array))
      move = @current_player.get_input(move_array)
      @move_list.push(move)
      move_array = @board.draw(@move_list)
      next_turn
    end
    announce_result(victor)
  end
  
  def winner(move_array)
    if @move_list.length == 42
      return 'TIE GAME!'
    end

    # columns and rows
    row1 = row2 = row3 = row4 = row5 = row6 = ''
    move_array.each_with_index {|col, i|
      col_str = col.join('')
      return 'X' if col_str.include?("XXXX")
      return 'O' if col_str.include?("OOOO")
      row1 += col[0]
      row2 += col[1]
      row3 += col[2]
      row4 += col[3]
      row5 += col[4]
      row6 += col[5]
    }
    return 'X' if row1.include?("XXXX")
    return 'O' if row1.include?("OOOO")
    return 'X' if row2.include?("XXXX")
    return 'O' if row2.include?("OOOO")
    return 'X' if row3.include?("XXXX")
    return 'O' if row3.include?("OOOO")
    return 'X' if row4.include?("XXXX")
    return 'O' if row4.include?("OOOO")
    return 'X' if row5.include?("XXXX")
    return 'O' if row5.include?("OOOO")
    return 'X' if row6.include?("XXXX")
    return 'O' if row6.include?("OOOO")

    # Diagonals (upper right -> lower left)
    (0..2).each {|row|
      str = ''
      temp_row = row
      col = 0
      while temp_row < 6
        str += move_array[col][temp_row]
        col += 1
        temp_row += 1
      end
      return 'X' if str.include?("XXXX")
      return 'O' if str.include?("OOOO")
    }

    (0..3).each {|col|
      str = ''
      temp_col = col
      row = 0
      while temp_col < 7 && row < 6
        str += move_array[temp_col][row]
        temp_col += 1
        row += 1
      end
      return 'X' if str.include?("XXXX")
      return 'O' if str.include?("OOOO")
    }

    # Diagonals (upper left -> lower right)
    (0..3).each {|col|
      str = ''
      temp_col = 3 - col
      row = 0
      while temp_col >=0 && row < 6
        str += move_array[temp_col][row]
        temp_col -= 1
        row += 1
      end
      return 'X' if str.include?("XXXX")
      return 'O' if str.include?("OOOO")
    }

    (0..2).each {|row|
      str = ''
      temp_row = row
      col = 6
      while temp_row < 6
        str += move_array[col][temp_row]
        col -= 1
        temp_row += 1
      end
      return 'X' if str.include?("XXXX")
      return 'O' if str.include?("OOOO")
    }

    false
  end

  def next_turn
    if @current_player == @player_x
      @current_player = @player_o
    else
      @current_player = @player_x
    end
  end

  def announce_result(victor)
    puts "Victor: #{victor}"
  end
end
