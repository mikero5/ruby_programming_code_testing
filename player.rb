# 
# 
# 
# 
# 

class Player
  attr_reader :symbol
  
  def initialize(symbol)
    @symbol = symbol
  end

  def get_input(move_array)
    valid = false
    input = nil
    while !valid
      print "Player " + @symbol + " enter move [1..7]: "
      input = gets.chomp
      valid = validate(input)
      if !valid
        puts "Invalid input, please enter number between 1 and 7, try again..."
      elsif move_array[input.to_i - 1][-1] != ' '
        valid = false
        puts "Invalid input, that column is full, please choose another column..."
      end
    end
    Move.new(input.to_i-1, @symbol)
  end

  def validate(input)
    puts "input: #{input}"

    if ('1'..'7').include?(input)
      return true
    else
      return false
    end
  end
  
end
