# round_spec.rb - run RSpec based tests on Deck class
#NOTE: there are several results from 'puts' due to it being run in several tests.  Is there a way to suppress that output here if I wish?
require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'
require 'rspec'

describe Round do
    # This allows me to not have to re-create this each time.  Admittedly, not much faster than copy/paste, but fun different thing to try!
    before(:each) do
        #UPDATE THIS!!!!!!!!!!!!!!!!!
        @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card1, @card2, @card3])
        @round = Round.new(@deck)
    end

    #TESTS GO HERE
    it 'round exists' do
        expect(@round).to be_a(Round)
    end

    it 'has a deck assigned' do
        expect(@round.deck).to eq(@deck)
    end

    it 'correctly tracks turns taken' do
        expect(@round.turns).to eq([])
    end

    it 'tracks current card' do
        expect(@round.current_card).to eq(@card1)
    end

    it 'take turn: check class' do
        new_turn = @round.take_turn("Juneau")

        expect(new_turn).to be_a(Turn)
    end

    it 'take turn: check correct guess' do
        new_turn = @round.take_turn("Juneau")

        expect(new_turn.correct?()).to eq(true)
    end

    it 'take turn: check number correct' do
        new_turn = @round.take_turn("Juneau")

        expect(@round.number_correct()).to eq(1)
    end

    it 'take turn: check advance to next card' do
        new_turn = @round.take_turn("Juneau")

        expect(@round.current_card).to eq(@card2)
    end

    it 'take second turn: check number turns' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        # expect(turn2.count()).to eq(2)
        expect(@round.turns.count())
    end

    it 'take second turn: check feedback for second turn' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        expect(@round.turns.last.feedback()).to eq(nil)      #Again, due to puts (but there will be printed output to confirm)
    end

    it 'take second turn: check number correct' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        expect(@round.number_correct()).to eq(1)
    end

    it 'take second turn: check number correct by category' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'take second turn: check percent correct' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        expect(@round.percent_correct()).to eq(50.0)
    end

    it 'take second turn: check percent correct by category' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end

    #I decided to add these based on additional functionality I made.  I'm not satisfied with them.
    #They are very special case checks only, not general.  Maybe I'll learn a more thorough way later.

    it 'verify element in @all_categories exists, converts to string' do
        puts @round.all_categories[2].to_s
        expect(@round.all_categories[1].to_s).to eq("STEM")
    end

    it 'verify @all_cateogries is proper total' do
        expect(@round.all_categories.length).to eq(2)
    end

    it 'verify @all_categories has exact correct elements' do
        expect(@round.all_categories).to eq([:Geography, :STEM])
    end

end
