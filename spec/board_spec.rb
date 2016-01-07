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

    it "place disk is ok when new disk placed" do 
        expect( this_board.board[0][3]).to eq(nil)
        this_board.place_disk(Disk.make_player_1_disk,3)
        expect( this_board.board[0][3]).to be_a(Disk)
    end


    it "should fail if column is full" do
        Board::NUM_ROWS.times do
            this_board.place_disk( Disk.make_player_1_disk, 4 )
        end

        # theres an off-by-one situation between the connect4 grid and the board Array
        #behavior is correct, test passes
        expect( this_board.valid_move?( 5 ) ).to eq(false)
    end

    it "should check row correctly" do
   
        this_board.place_disk(Disk.make_player_1_disk,2)
        this_board.place_disk(Disk.make_player_1_disk,3)
        this_board.place_disk(Disk.make_player_1_disk,4)

        expect( this_board.check_rows).to eq(false)

        this_board.place_disk(Disk.make_player_1_disk,5)
        
        expect( this_board.check_rows).to eq(true)

    end

    it "should check col correctly" do
   
        this_board.place_disk(Disk.make_player_1_disk,2)
        this_board.place_disk(Disk.make_player_1_disk,2)
        this_board.place_disk(Disk.make_player_1_disk,2)

        expect( this_board.check_cols).to eq(false)

        this_board.place_disk(Disk.make_player_1_disk,2)
        
        expect( this_board.check_cols).to eq(true)

    end

    it "should check upward diagonals correctly" do
   
        this_board.place_disk(Disk.make_player_1_disk,2)
        this_board.place_disk(Disk.make_player_2_disk,3)
        this_board.place_disk(Disk.make_player_1_disk,3)

        this_board.place_disk(Disk.make_player_2_disk,4)
        this_board.place_disk(Disk.make_player_2_disk,4)
        this_board.place_disk(Disk.make_player_1_disk,4)

        this_board.place_disk(Disk.make_player_2_disk,5)
        this_board.place_disk(Disk.make_player_2_disk,5)
        this_board.place_disk(Disk.make_player_2_disk,5)

        expect( this_board.check_diagonals).to eq(false)
        
        this_board.place_disk(Disk.make_player_1_disk,5)
        
        expect( this_board.check_diagonals).to eq(true)

    end

    it "should check downward diagonals correctly" do
   
        this_board.place_disk(Disk.make_player_2_disk,2)
        this_board.place_disk(Disk.make_player_2_disk,2)
        this_board.place_disk(Disk.make_player_2_disk,2)
        this_board.place_disk(Disk.make_player_1_disk,2)

        this_board.place_disk(Disk.make_player_2_disk,3)
        this_board.place_disk(Disk.make_player_2_disk,3)
        this_board.place_disk(Disk.make_player_1_disk,3)

        this_board.place_disk(Disk.make_player_2_disk,4)
        this_board.place_disk(Disk.make_player_1_disk,4)

        expect( this_board.check_diagonals).to eq(false)
        
        this_board.place_disk(Disk.make_player_1_disk,5)
        
        expect( this_board.check_diagonals).to eq(true)

    end
end
