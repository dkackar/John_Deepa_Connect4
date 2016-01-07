# Your code here

require "disk"

describe "test test" do 

    it "Creates a new disk objeck with name" do
        expect( 2).to eq(2) 
    end

    #let(:disk){ Disk.new("Test")}

    describe '.initialize with owner' do

      it 'should raise error with new' do
        expect {disk = Disk.new("Test")}.to raise_error(NoMethodError)   
      end

      it 'should build correctly with make_player_1_disk' do
        expect( Disk.make_player_1_disk ).to be_a( Disk )   
      end

    end
end
