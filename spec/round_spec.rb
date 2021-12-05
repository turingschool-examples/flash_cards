require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

describe Round do

  it 'exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it 'start turn' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.turns).to eq([])
  end

  it 'counts number of cards' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.count).to eq(3)
  end

  # it 'show currect card' do
  #   card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  #   card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #   round = Round.new(deck)
  #   expect(round).to eq([])
  # end

  xit 'counts number of correct' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.number_correct).to eq(1)
  end

end
