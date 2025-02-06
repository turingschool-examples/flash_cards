require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Deck do
    # This test is checking to see if card returns the question, answer and category of card
    # It's also
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau",card)
        deck = Deck.new(card)
    
        expect(deck).to be_instance_of(Deck)
      end
    # it 'makes a guess' do
    #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     turn = Turn.new("Juneau",card)
    
    #     expect(turn.guess).to eq("Juneau")
    # end
    # it 'checks if the guess is correct' do
    #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     turn = Turn.new("Juneau",card)
    
    #     expect(turn.correct?).to eq(true)
    # end
    # it 'checks for feedback' do
    #     card= Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     turn = Turn.new("Juneau",card)

    #     expect(turn.feedback).to eq("Correct!")
    # end
   
end