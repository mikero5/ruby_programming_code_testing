# 
# 
# 
# 
# 

class Move
  attr_accessor :column
  attr_accessor :symbol

  def initialize(col, sym)
    @column = col
    @symbol  = sym
  end
  
end
