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
end

#initialize with deck as parameter

#return round.deck

#begins with an empty turns array, empty current_card

#returns current_card

#uses take_turn create a new turn object with a string as a parameter, the turn's guess

#new_turn.class returns true - What is this?

#returns turns, an array of turn objects

#returns the turns.correct? method

#number_correct method

#number_correct_by_category method

#percent_correct method

#percent_correct_by_category method

#empty deck