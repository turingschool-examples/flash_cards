require './lib/card'
require './lib/turn'

card_1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")

turn_1 = Turn.new(card_1, "Ultrasonography")


require 'pry'; binding.pry


#RSpec.describe Card do
  #it 'exists' do
   # card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", :Personal)

    #expect(card_1).to be_instance_of(Card)
  #end
#end
