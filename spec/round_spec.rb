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

    # it can call the deck
    # it can store and call turns
    # it can store the current card
    # it can accept an answer and go to the next card
    # it is an instance of the Turn class
    # it can store if correct
    # it can recall turns
    # it can return the amount of correct guesses
    # it can identify the current card
    # it can take a new turn
    # it can count how many turns have been taken
    # it can recall feedback from the last card
    # it can count how many turns guessed the correct answer
    # it can identify the amount of correct guesses by category
    # it can load the current card
end
