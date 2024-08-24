require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")


card2 = Card.new("What does Dr. Reeve love?", "Poms", "Personal")


card3 = Card.new("What vein is best to place and IV catheter?", "Cephalic", "Medical")


cards = [card1, card2, card3]

deck = Deck.new(cards)

round = Round.new(deck)

round.take_turn



#require 'pry'; binding.pry


RSpec.describe Card do
  it 'exists' do
    card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")

    expect(card_1).to be_instance_of(Card)
  end

  it 'has a question' do
    card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")
  
    expect(card_1.question).to eq("What is Dr. Brown's specialty?")
  end
  
  it 'has an answer' do
    card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")
  
    expect(card_1.answer).to eq("Ultrasonography")
  end
  
  it 'has a category' do
    card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")
  
    expect(card_1.category).to eq("Personal")
  end
end