require './lib/card_generator'
require './lib/deck'

    filename = File.read("cards.txt")
    file_with = filename.split("\n")

RSpec.describe CardGenerator do

#Test 1
#See that cards exists
    it "cards exists" do

        cards = CardGenerator.new(file_with)

        expect(cards).to be_instance_of(CardGenerator)

    end

#Test 2
#See that cards holds the cards in the txt file

    it "cards has all 4 cards" do
        
        cards = CardGenerator.new(file_with)
       require 'pry'; binding.pry 

       expect(cards)to be_instance_of(Card)
    end

end