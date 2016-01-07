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

    it "check connect four" do 
        this_board.place_disk(Disk.make_player_1_disk,3)
        this_board.place_disk(Disk.make_player_1_disk,4)
        this_board.place_disk(Disk.make_player_2_disk,5)
        this_board.place_disk(Disk.make_player_1_disk,6)
        my_array = []
        my_array << this_board.board[0][3]
        my_array << this_board.board[0][4]
        my_array << this_board.board[0][5]
        my_array << this_board.board[0][6]


        this_board.place_disk(Disk.make_player_2_disk,3)
        this_board.place_disk(Disk.make_player_2_disk,4)
        this_board.place_disk(Disk.make_player_2_disk,5)
        this_board.place_disk(Disk.make_player_2_disk,6)
        my_array2 = []
        my_array2 << this_board.board[1][3]
        my_array2 << this_board.board[1][4]
        my_array2 << this_board.board[1][5]
        my_array2 << this_board.board[1][6]

 
        #method does check that all disks have the same owner
        expect( this_board.check_connect_four?( my_array )).to eq(false)
        expect( this_board.check_connect_four?( my_array2 )).to eq(true)
        my_array2 << this_board.board[0][5]
        expect( this_board.check_connect_four?( my_array2 )).to eq(false)
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

    it "should check for grid_full?" do
        (Board::NUM_ROWS - 1).times do
            (0..6).each do | i |
                this_board.place_disk( Disk.make_player_1_disk, i )
            end
        end
        expect( this_board.grid_full? ).to eq(false)
        (0..6).each do | i |
            this_board.place_disk( Disk.make_player_1_disk, i )
        end
        expect( this_board.grid_full? ).to eq(true)

    end

    it "should check object copy" do

        copy = this_board.dup
        ret_val_bool = true

       (0...Board::NUM_ROWS).each do |row|
          (0...Board::NUM_COLS).each do |col|
            if this_board.board[row][col]
                ret_val_bool && this_board.board[row][col].owner == copy.board[row][col].owner
            else
                ret_val_bool && this_board.board[row][col] == copy.board[row][col]
            end               
          end
       end

        expect( ret_val_bool ).to eq(true)
    end
end
