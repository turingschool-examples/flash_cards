require './lib/card'
require './lib/turn'

card1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")


card2 = Card.new("What does Dr. Reeve love?", "Poms", "Personal")


card3 = Card.new("What vein is best to place and IV catheter?", "Cephalic", "Medical")


turn1 = Turn.new(card1, "Chemo")

turn2 = Turn.new(card2, "Poms")

turn3 = Turn.new(card3, "Saphenous")

require 'pry'; binding.pry

RSpec.describe Turn do
    it 'has a guess' do

      turn1 = Turn.new(card1, "Chemo")

    expect(turn1.guess).to eq("Chemo")
    end
end