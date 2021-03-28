require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  describe "#initialize" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  =  [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)
    it 'is a round' do
      expect(round).to be_instance_of(Round)
    end
    it 'has deck' do
      expect(round.deck).to eq (deck)
    end
  end

  describe '#add_turn' do
    it 'has turns' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     cards  =  [card_1, card_2, card_3]
     deck   = Deck.new(cards)
     round  = Round.new(deck)
     expect(round.turns).to eq ([])
   end
 end

 describe '#current_card' do
   it 'has current card' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     cards  =  [card_1, card_2, card_3]
     deck   = Deck.new(cards)
     round  = Round.new(deck)
     expect(round.current_card).to eq (card_1)
   end
 end

 describe '#take_turn' do
   it 'takes turn' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     cards  =  [card_1, card_2, card_3]
     deck   = Deck.new(cards)
     round  = Round.new(deck)
     expect(new_turn = round.take_turn("Juneau")).to eq (new_turn)
     expect(new_turn.class).to eq (Turn)
     expect(new_turn.correct?).to eq true
     expect(round.turns).to eq ([new_turn])
   end
 end

 describe '#number_correct' do
   it 'reads the current round' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     cards  =  [card_1, card_2, card_3]
     deck   = Deck.new(cards)
     round  = Round.new(deck)
     round.take_turn("Juneau")
     expect(round.number_correct).to eq 1
   end
 end

 describe '#current_card' do
   it 'has current card' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     cards  =  [card_1, card_2, card_3]
     deck   = Deck.new(cards)
     round  = Round.new(deck)
     round.take_turn("Juneau")
     expect(round.current_card).to eq (card_2)
   end
 end

#  describe '#turn_count' do
#    xit 'counts turns' do
#      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#      cards  =  [card_1, card_2, card_3]
#      deck   = Deck.new(cards)
#      round  = Round.new(deck)
#      round.take_turn("Juneau")
#      round.take_turn("Venus")
#      expect(round.take_turn("Venus")).to eq (new_turn)
#      expect(new_turn.class).to eq (Turn)
#      expect(new_turn.correct?).to eq false
#      expect(round.turns).to eq ([new_turn])
#    end
#   end
# end
