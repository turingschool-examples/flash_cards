require './lib/deck.rb'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/round.rb'

RSpec.describe Round do
  it 'exists' do
  card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [card1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)

  expect(round1).to be_instance_of(Round)
  end

it 'returns the given deck' do
  card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [card1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)

  expect(round1.deck).to eq(deck1)
  end

it 'begins with an empty turns array' do
  card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [card1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)

  expect(round1.turns).to eq([])
  end

  it 'begins with the first card in the deck array' do
    myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [myCard1,myCard2,myCard3]
    deck1 = Deck.new(cards)
    round1 = Round.new(deck1)
  
    expect(round1.current_card).to eq(myCard1)
    end

it 'uses take_turn create a new turn object with a string as a parameter, the turn\'s guess' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  round1.take_turn("Juneau")

  expect(round1.turns[0]).to be_instance_of(Turn)
  expect(round1.turns[0].guess).to eq("Juneau")
  end


#returns current_card in the middle of a round

#returns current_card when there is no more remaining

#new_turn.class returns true - What is this?

#returns turns, an array of turn objects

#returns the turns.correct? method

#number_correct method

#number_correct_by_category method

#percent_correct method

#percent_correct_by_category method

#empty deck

end