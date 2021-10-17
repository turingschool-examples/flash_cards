require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  describe 'current_card' do
    it 'returns current card from the deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      expect(round.current_card).to eq(card_1)
    end
  end

  describe 'take_turn' do
    it 'creates a turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(new_turn).to be_a(Turn)
    end
  end

  describe 'correct? answer' do
    it 'checks if guess is correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

       expect(new_turn.correct?).to eq(true)
     end

     it 'checks if guess is incorrect' do
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       deck = Deck.new([card_1, card_2, card_3])
       round = Round.new(deck)
       new_turn = round.take_turn("Junbeau")
       round.take_turn("Venus")
       expect(new_turn.correct?).to eq(false)
     end
   end

   describe 'number_correct' do
     it 'returns current number of correct answers' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     deck = Deck.new([card_1, card_2, card_3])
     round = Round.new(deck)
     new_turn = round.take_turn("Juneau")
     expect(round.number_correct).to eq(1)
   end
 end

 describe 'number_correct_by_category' do
   it 'returns number of correct answers in that category' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     deck = Deck.new([card_1, card_2, card_3])
     round = Round.new(deck)
     new_turn = round.take_turn("Juneau")
     # require 'pry'; binding.pry
     expect(round.number_correct_by_category(:Geography)).to eq(1)
   end

   describe 'percent_correct' do
     it 'returns the percentage of correct answers guessed' do
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       deck = Deck.new([card_1, card_2, card_3])
       round = Round.new(deck)
       new_turn = round.take_turn("Juneau")
       new_turn_2 = round.take_turn("Venus")
       expect(round.percent_correct).to eq(50)
     end

   end

   describe 'percent_correct_by_category' do
     it 'returns the percentage of correct answers by category' do
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       deck = Deck.new([card_1, card_2, card_3])
       round = Round.new(deck)
       new_turn = round.take_turn("Juneau")

       expect(round.percent_correct_by_category(:Geography)).to eq(100)
     end

   end



   end
end
