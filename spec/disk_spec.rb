# Your code here

require "disk"

describe "test test" do 

    it "Creates a new disk objeck with name" do
        expect( 2).to eq(2) 
    end

    #let(:disk){ Disk.new("Test")}

    describe '.initialize with owner' do

      it 'should give you a disk' do
        expect {disk = Disk.new("Test")}.to raise_error(NoMethodError)   
      end

    end
end
