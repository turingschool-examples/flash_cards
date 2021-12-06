require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    describe '#initialize'do
    it "exists" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end
end
it 'has has a deck' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  expect(round.deck).to eq(deck)
end
it 'is the current card' do
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
expect(round.current_card).to eq(card_1)
end

it 'takes a turn' do
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1])
round = Round.new(deck)
expect(round.turns)to eq[]
end

it 'takes a new turn' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn = round.take_turn("Juneau")
  expect(round.turns)[turn]
end

it 'returns a Turn' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1])
  round = Round.new(deck)
  turn = round.take_turn("Juneau")
  expect(new_turn.class).to eq (Turn)
end

def 'is turn correct' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1])
  round = Round.new(deck)
  expect(new_turn.correct?)to eq("Juneau")
end

it 'is the another current card' do
#card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
expect(round.current_card).to eq(card_2)
end

it 'returns another Turn' do
  #card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_2])
  round = Round.new(deck)
  turn = round.take_turn("Venus")
  expect(new_turn.class).to eq (Turn)
  #incorrect
end
 it 'turn incorrect feedback' do
     #card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     deck = Deck.new([ card_2])
     round = Round.new(deck)
     round.take_turn('Venus')
     expect(round.turns.last.feedback)to eq("Incorrect")
   end

   it 'count correct guesses' do
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       deck = Deck.new([card_1, card_2])
       round = Round.new(deck)
       round.take_turn("Juneau")
       expect(round.number_correct).to eq(1)
       round.take_turn("Venus")
       expect(round.number_correct).to eq(1)
     end
     it 'can count number correct by category' do
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       deck = Deck.new([card_1, card_2])
       round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Mars")
      expect(round.number_correct_by_category).to be(:Geography, 1)
      expect(round.number_correct_by_category).to be(:STEM, 0)
     end
  it 'keeps percent_correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    expect(round.percent_correct).to eq(100.0)
    round.take_turn("Venus")
    expect(round.percent_correct).to eq(50.0)
  end
it 'gives percent_correct_by category' do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1])
  round = Round.new(deck)
  expect(round.percent_correct_by_category)to eq(:Geography, 100.00)
end
#did not finish
  #end
