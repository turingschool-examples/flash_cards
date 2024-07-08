require 'rspec'
require './lib/Card_generator'

RSpec.describe 'Card_generator' do
    before(:each) do
        @input = Card_generator.new
    end
    it 'should convert text file into array' do
        expect(@input.file_array).to be_instance_of Array
    end

    it 'should create a Hash from the array' do
        expext(@input.file_hash).to be_instance_ of Hash
    end
end