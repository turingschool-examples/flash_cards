require './lib/card_generator'

RSpec.describe CardGenerator do

 # test it can create new card instances with text file
 it '' do
   filename = "cards.txt"
   cards = CardGenerator.new(filename).cards

   expect(cards).to be_instance_of(CardGenerator)
 end
end
