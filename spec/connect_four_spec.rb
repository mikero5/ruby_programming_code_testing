require_relative '../connect_four.rb'


RSpec.describe ConnectFour do
# 
# play
# winner
# next_turn
# announce_result
# 

  
  describe "#winner" do
    cf = ConnectFour.new
    move_array = Array.new(7){ Array.new(6){' '} }
    board = Board.new
    
    it "no winner yet" do
      expect(cf.winner(move_array)).to eql(false)
    end

    it "player X wins" do
      cf.move_list = [Move.new(0, 'X'), Move.new(1, 'X'), Move.new(2, 'X'), Move.new(3, 'X')]
      move_array = board.make_move_array_from_list(cf.move_list)
      expect(cf.winner(move_array)).to eql('X')
    end

    it "player O wins" do
      cf.move_list = [Move.new(0, 'X'), Move.new(1, 'X'), Move.new(2, 'X'), Move.new(3, 'X')]
      move_array = board.make_move_array_from_list(cf.move_list)
      expect(cf.winner(move_array)).to eql('X')
    end
  end  # describe "#winner"

  describe "#next_turn" do
  end

  describe Player do
    # 
    # get_input
    # validate
    # 
    player = Player.new('X')
    
    describe "#validate" do
      it "valid input" do
        expect(player.validate('1')).to eql(true)
      end
      it "invalid input" do
        expect(player.validate('0')).to eql(false)
        expect(player.validate('8')).to eql(false)
      end
    end
  end  # describe Player

  describe Board do
    # 
    # draw
    # make_move_array_from_list
    # 
    board = Board.new

    it "#make_move_array_from_list" do
    end
  end  # describe Board 
  
end

