require './lib/card_generator'

    filename = "cards.txt"


RSpec.describe CardGenerator do

#Test 1
#See that cards is an array of the cards in the txt file
    it "cards exists" do

cards = CardGenerator.new(filename).cards

require 'pry'; binding.pry

expect(cards).to be_instance_of(CardGenerator)

    end

end