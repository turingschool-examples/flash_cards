require './lib/deck.rb'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/round.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

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
  expect(round1.turns[0].class).to eq(Turn)
  end

it 'uses take_turn create a new turn object with a string as a parameter, the turn\'s guess, which can be incorrect' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  round1.take_turn("Anchorage")
  
  expect(round1.turns[0]).to be_instance_of(Turn)
  expect(round1.turns[0].guess).to eq("Anchorage")
  expect(round1.turns[0].class).to eq(Turn)
  end



it 'iterates the current card at the end of take_turn' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  round1.take_turn("Anchorage")
  
  expect(round1.current_card).to eq(myCard2)
  end
it 'returns turns, an array of turn objects when there are multiple turns' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
  turn2 = round1.take_turn("Mars")
    
  expect(round1.turns).to eq([turn1,turn2])
end
it 'returns current_card when there is no more remaining' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")
      
  expect(round1.current_card).to eq(nil)
end
it 'returns turns.correct when correct' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")
      
  expect(round1.turns[0].correct?).to eq(true)
end
it 'returns turns.correct when incorrect' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
      
  expect(round1.turns[0].correct?).to eq(false)
end
it 'returns number_correct when there have been no guesses' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
      
  expect(round1.number_correct).to eq(0)
end
it 'returns number_correct when there have been guesses but none correct' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
      
  expect(round1.number_correct).to eq(0)
end

it 'returns number_correct when there have been correct guesses' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")
  turn1 = round1.take_turn("Mars")
      
  expect(round1.number_correct).to eq(2)
end

it 'returns number_correct when there have been both correct and incorrect guesses' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")
  turn1 = round1.take_turn("Venus")
      
  expect(round1.number_correct).to eq(1)
end

#number_correct_by_category method
#number_correct_by_category when there have been no guesses
#number_correct_by_category when there have been guesses but none correct
#number_correct_by_category 1 correct guess
#number_correct_by_category 2 correct guesses

#percent_correct method
#percent_correct when there have been no guesses
#percent_correct when there have been guesses but none correct
#percent_correct 1 correct guess
#percent_correct 2 correct guesses

#percent_correct_by_category method
#percent_correct when there have been no guesses
#percent_correct when there have been guesses but none correct
#percent_correct 1 correct guess
#percent_correct 2 correct guesses

#empty deck?

end