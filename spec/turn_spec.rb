# Will need to include both the Card and Turn file for this test file since
# Turn uses Card objects
require 'rspec'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do

    # initialize
    it 'exists' do
      card = Card.new("What is the capital of Alaska", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn).to be_instance_of(Turn)
    end

    it 'has a guess' do
      card = Card.new("What is the capital of Alaska", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.guess).to eq("Juneau")
    end

    it 'has a card' do
      card = Card.new("What is the capital of Alaska", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.card).to eq(card)
    end





    # guess
    it 'check if guess is correct' do
      card = Card.new("What is the capital of Alaska", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.guess).to eq(card.answer)
    end


    # feedback - Tests if someone puts in correct answer
    it 'if correct feedback' do
      card = Card.new("What is the capital of Alaska", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq("Correct!")
    end

    # guess - Tests if someone puts in an incorrect answer
    it 'if incorrect feedback' do
      card = Card.new("Which planet is closet to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.feedback).to eq("Incorrect")
    end

    it 'provides incorrect guess' do
      card = Card.new("Which planet is closet to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.guess).to eq("Saturn")
    end

end


# will get new card on new turn
