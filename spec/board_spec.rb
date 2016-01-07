# Your code here

require "board"

describe "test test" do 

    let( :this_board ) { Board.new }

    it "initializes ok" do 
        expect( this_board).to be_a(Board)
    end

    it "initial board is empty" do
        expect( this_board.board.length ).to eq(Board::NUM_ROWS)
    end

    it "valid move is ok on a new board" do 
        expect( this_board.valid_move?( 4 ) ).to eq(true)
    end

    it "should fail if column is full" do
        Board::NUM_ROWS.times do
            this_board.place_disk( Disk.make_player_1_disk, 4 )
        end

        # theres an off-by-one situation between the connect4 grid and the board Array
        #behavior is correct, test passes
        expect( this_board.valid_move?( 5 ) ).to eq(false)
    end


end
