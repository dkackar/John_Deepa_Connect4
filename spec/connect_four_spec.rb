
require "connect_four"

describe "ConnectFour" do 
    
  let(:game){ ConnectFour.new}

  describe "main game tests" do

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
  
    it "check end conditions" do
        game.board.place_disk(Disk.make_player_1_disk,3)
        game.board.place_disk(Disk.make_player_1_disk,4)
        game.board.place_disk(Disk.make_player_1_disk,5)
        expect(game.end_conditions?).to eq(false)
        game.board.place_disk(Disk.make_player_1_disk,6)

        expect(game.end_conditions?).to eq(true)
    end

    it 'should process move for player 2' do
      game.current_player = false
      game.process_move(3)
      expect(game.board.board[0][2].owner).to eq("2")
    end

    it 'should process move for player 1' do
      game.current_player = true
      game.process_move(3)
      expect(game.board.board[0][2].owner).to eq("1")
    end

  end  
end    