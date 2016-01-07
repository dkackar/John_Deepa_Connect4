
require "connect_four"

describe "ConnectFour" do 
    
  let(:game){ ConnectFour.new}

  describe '.creates an empty board' do

    it 'should give you a Board' do
      expect(game.board).to be_a(Board)
    end
    it 'should give you a Board' do
      expect(game.board).to be_a(Board)
    end
  end  
end    