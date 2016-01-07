
require "connect_four"

describe "ConnectFour" do 
    
  let(:game){ ConnectFour.new}

  describe '.creates an empty board' do

    it 'should give you a Board' do
      expect(game.board).to be_a(Board)
    end

    it 'should initialize opponent to 2' do
      expect(game.opponent).to eq("2")
    end

    it 'should initialize current_player to true' do
      expect(game.current_player).to eq(true)
    end

   it 'should have receive correct input value from user' do
       inp = allow(game.print_intro).to receive(:gets).and_return("1,2")
       if inp == "1"
          expect(game.opponent).to be_a(Computer)
       end
   end
  end  
end    