require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Card do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it 'can create three instances of Cards' do
    expect(@card_1).to be_instance_of(Card)
    expect(@card_1.answer).to eq("Juneau")
    expect(@card_2.question).to eq("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?")
    expect(@card_3.category).to eq(:STEM)
  end

  it 'can store Cards in a Deck' do
    expect(@deck).to be_instance_of(Deck)
    expect(@deck.cards).to eq(@cards)
    expect(@deck.cards[0].answer).to eq("Juneau")
    expect(@deck.cards[1].question).to eq("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?")
    expect(@deck.cards[2].category).to eq(:STEM)
  end

  it 'can count the number of cards in a deck' do
    expect(@deck.count).to equal(3)
  end

  it 'can call cards by category' do
    expect(@deck.cards_in_category(:STEM)).to eq(@cards[1,2])
    expect(@deck.cards_in_category(:Geography)).to eq(@cards.first(1))
    expect(@deck.cards_in_category("Pop Culture")).to eq([])
  end
end
