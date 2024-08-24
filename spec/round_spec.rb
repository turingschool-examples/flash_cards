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
  turn2 = round1.take_turn("Venus")
      
  expect(round1.number_correct).to eq(1)
end

it 'returns number_correct_by_category when there have been no guesses and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
      
  expect(round1.number_correct_by_category(:Geography)).to eq(0)
end

it 'number_correct_by_category when there have been guesses but none correct and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
  turn2 = round1.take_turn("Venus")
  turn3 = round1.take_turn("I have no idea")

  expect(round1.number_correct_by_category(:Geography)).to eq(0)
  expect(round1.number_correct_by_category(:STEM)).to eq(0)
end

it 'number_correct_by_category 1 correct guess and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
  turn2 = round1.take_turn("Mars")
  turn3 = round1.take_turn("I have no idea")

  expect(round1.number_correct_by_category(:Geography)).to eq(0)
  expect(round1.number_correct_by_category(:STEM)).to eq(1)
end

it 'number_correct_by_category 2 correct guess and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")
  turn2 = round1.take_turn("Mars")
  turn3 = round1.take_turn("North north west")

  expect(round1.number_correct_by_category(:Geography)).to eq(1)
  expect(round1.number_correct_by_category(:STEM)).to eq(2)
end

it '#number_correct_by_category no cards in a category' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")

  expect(round1.number_correct_by_category(:History)).to eq(0)
end

it 'returns percent_correct when there have been no guesses' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
      
  expect(round1.percent_correct).to eq(nil)
end

it 'returns percent_correct when there have been guesses but none correct' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
      
  expect(round1.percent_correct).to eq(0)
end

it 'returns percent_correct when there have been both correct and incorrect guesses' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")
  turn2 = round1.take_turn("Venus")
      
  expect(round1.percent_correct).to eq(50)
end

it 'returns percent_correct rounded to 2 decimal places when there have been both correct and incorrect guesses' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Juneau")
  turn2 = round1.take_turn("Mars")
  turn1 = round1.take_turn("South-ish")

  expect(round1.percent_correct).to eq(66.67)
end

it 'returns number_correct_by_category when there have been no guesses and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [myCard1]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
      
  expect(round1.percent_correct_by_category(:Geography)).to eq(nil)
end

it 'percent_correct_by_category when there have been guesses but none correct and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
  turn2 = round1.take_turn("Venus")
  turn3 = round1.take_turn("I have no idea")

  expect(round1.percent_correct_by_category(:Geography)).to eq(0)
  expect(round1.percent_correct_by_category(:STEM)).to eq(0)
end

it 'percent_correct_by_category 1 correct guess and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [myCard1,myCard2,myCard3,]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
  turn2 = round1.take_turn("Mars")
  turn3 = round1.take_turn("I have no idea")

  expect(round1.percent_correct_by_category(:Geography)).to eq(0)
  expect(round1.percent_correct_by_category(:STEM)).to eq(50)
end

it 'percent_correct_by_category 2 correct guess and multiple categories' do
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  myCard4 = Card.new("What is objectively the best rodent?", "Capybara", :STEM)
  cards = [myCard1,myCard2,myCard3,myCard4]
  deck1 = Deck.new(cards)
  round1 = Round.new(deck1)
  turn1 = round1.take_turn("Anchorage")
  turn2 = round1.take_turn("Mars")
  turn3 = round1.take_turn("I have no idea")
  turn4 = round1.take_turn("CAPYBARA")

  expect(round1.percent_correct_by_category(:Geography)).to eq(0)
  expect(round1.percent_correct_by_category(:STEM)).to eq(66.67)
end

#empty deck?
#round.turns.count
#round.turns.last.feedback
end