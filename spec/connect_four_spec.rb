
require "connect_four"

describe "test test" do 
    
  let(:board){ Board.new}

  describe '.creates an empty board' do

    it 'should give you a Board' do
      expect(board).to be_a(Board)
    end

  end

end    