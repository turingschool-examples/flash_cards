require 'rspec'
require './lib/Card_generator'

RSpec.configure do |config|
    config.formatter = :documentation
end
    
describe 'Card_generator' do
   
    before(:each) do
        @input = CardGenerator.new('./cards.txt')
    end

    describe '#initialize' do
        it 'should convert text file into array' do
            expect(@input.file_array).to be_instance_of Array
        end
    end

    describe '#convert_to_useful' do
        it 'should convert @file_array to be set of nested arrays' do
            # @input.convert_to_useful

        
            expect(@input.file_array).to be_instance_of Array
            expect(@input.file_array[0]).to be_instance_of Array
        end

        it 'should translate the content of the text file so each card instance arguments are isolated to a unique array' do    
            @input.convert_to_useful
            expect(@input.file_array[0]).to eq ["What is 5 + 5?", "10", "STEM"]
            expect(@input.file_array[1]).to eq ["What is Rachel's favorite animal?", "red panda", "Turing Staff"]
            expect(@input.file_array[2]).to eq ["What is Mike's middle name?", "nobody knows", "Turing Staff"]
            expect(@input.file_array[3]).to eq ["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"]
        end 
    end

    describe '#cards' do 
        it'should contain appropriate number of Card objects'
        require'pry';binding.pry
    end
end
