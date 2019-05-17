# 
# 
# 
# 
# 
# 

class Board
  attr_reader :move_array
  
  def initialize
    @move_array = nil
  end

  def draw(move_list)
    make_move_array_from_list(move_list)
    
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "|  1  |  2  |  3  |  4  |  5  |  6  |  7  |"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@move_array[0][5]}  |  #{@move_array[1][5]}  |  #{@move_array[2][5]}  |  #{@move_array[3][5]}  |  #{@move_array[4][5]}  |  #{@move_array[5][5]}  |  #{@move_array[6][5]}  |"
    puts "|     |     |     |     |     |     |     |"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@move_array[0][4]}  |  #{@move_array[1][4]}  |  #{@move_array[2][4]}  |  #{@move_array[3][4]}  |  #{@move_array[4][4]}  |  #{@move_array[5][4]}  |  #{@move_array[6][4]}  |"
    puts "|     |     |     |     |     |     |     |"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@move_array[0][3]}  |  #{@move_array[1][3]}  |  #{@move_array[2][3]}  |  #{@move_array[3][3]}  |  #{@move_array[4][3]}  |  #{@move_array[5][3]}  |  #{@move_array[6][3]}  |"
    puts "|     |     |     |     |     |     |     |"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@move_array[0][2]}  |  #{@move_array[1][2]}  |  #{@move_array[2][2]}  |  #{@move_array[3][2]}  |  #{@move_array[4][2]}  |  #{@move_array[5][2]}  |  #{@move_array[6][2]}  |"
    puts "|     |     |     |     |     |     |     |"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@move_array[0][1]}  |  #{@move_array[1][1]}  |  #{@move_array[2][1]}  |  #{@move_array[3][1]}  |  #{@move_array[4][1]}  |  #{@move_array[5][1]}  |  #{@move_array[6][1]}  |"
    puts "|     |     |     |     |     |     |     |"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@move_array[0][0]}  |  #{@move_array[1][0]}  |  #{@move_array[2][0]}  |  #{@move_array[3][0]}  |  #{@move_array[4][0]}  |  #{@move_array[5][0]}  |  #{@move_array[6][0]}  |"
    puts "|     |     |     |     |     |     |     |"
    puts "+-----+-----+-----+-----+-----+-----+-----+"
    @move_array
  end

  def make_move_array_from_list(move_list)
    @move_array = Array.new(7){ Array.new(6){' '} }
    move_list.each{|el|
      col = el.column
      next_pos = 5 - (@move_array[col].select{|el|
        el == ' '
      }.length-1)
      @move_array[col][next_pos] = el.symbol
    }
    @move_array
  end
end
