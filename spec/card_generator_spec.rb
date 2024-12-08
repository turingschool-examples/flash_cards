# card_generator_spec.rb - run RSpec based tests on Deck class
#NOTE: there are several results from 'puts' due to it being run in several tests.  Is there a way to suppress that output here if I wish?
require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'rspec'

describe CardGenerator do
    #UPDATE THIS CODE APPROPRIATELY
    This allows me to not have to re-create this each time.  Admittedly, not much faster than copy/paste, but fun different thing to try!
    before(:each) do
        #UPDATE THIS!!!!!!!!!!!!!!!!!
        @filename = "cards.txt"
        @cards = CardGenerator.new(@filename).cards

        # @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        # @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        # @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        # @deck = Deck.new([@card1, @card2, @card3])
        # @round = Round.new(@deck)
    end

    #TESTS GO HERE
    it 'initializes correctly: first card exists' do
        #Needs to return a card array
        # filename = "cards.txt"
        # cards = CardGenerator.new(filename).cards

        expect(@cards[0]).to be_a(Card)
    end

    it 'initializes correctly: correct # of cards exist' do
        expect(@cards.length).to eq(4)
    end

    it 'initializes correctly: third card has correct information' do
        #Again, this feels silly, having to target one specific card...it will break if the text file changes, etc.
        #How to generalize, e.g. to ensure each card has valid strings / data types present; and spot check still?
        expect(@cards[2].question).to eq("What is Mike's middle name?")
        expect(@cards[2].answer).to eq("nobody knows")
        expect(@cards[2].category).to eq(:Turing_staff)
        #Do I really have to break these each into a separate test?  Feels very tedious at that point...
    end


