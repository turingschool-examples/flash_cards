require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
  end

RSpec.describe Round do
it 'exists' do
  card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
  card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
  card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
  deck = Deck.new([@card_1, @card_2, @card_3])
  round = Round.new(deck)
  expect(round).to be_instance_of(Round)
  end

it 'returns an empty array' do
  card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
  card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
  card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
  deck = Deck.new([@card_1, @card_2, @card_3])
  round = Round.new(deck)
  expect(round.turns).to eq([])
end

it 'show the current card' do
  card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
  card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
  card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
  deck = Deck.new([@card_1, @card_2, @card_3])
  round = Round.new(deck)
  expect(round.current_card).to eq(@card_1)
end

it 'take a new turn' do
  card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
  card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
  card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
  deck = Deck.new([@card_1, @card_2, @card_3])
  round = Round.new(deck)
  new_turn = round.take_turn("Juneau")
  # expect(new_turn).to eq(turn)
  # expect(new_turn.class). to eq(Turn)
  expect(round.turns[0]).to eq(new_turn)
end

end
 