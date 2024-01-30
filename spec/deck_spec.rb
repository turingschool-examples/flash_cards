require './card.rb'
require './turn.rb'
require './deck.rb'

RSpec.describe Deck do
  cards = [
    Card.new("Question 1", "Answer 1", :category1),
    Card.new("Question 2", "Answer 2", :category2),
    Card.new("Question 3", "Answer 3", :category3)
  ]
  deck = Deck.new(cards)

  it 'cards property is an array' do
    expect(deck.cards).to be_an_instance_of(Array)
  end

  it 'cards array items are Cards' do
    for i in 0..deck.cards.length
        card = deck.cards[i]
        expect(card).to be_an_instance_of(Card)
    end
  end
end

