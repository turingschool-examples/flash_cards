# create deck method to identify the deck that is being used
# create turns method to identify what turns have happened if any
# create current card method to pull the first card from the deck
# create take_turn method that will receive a guess from the terminal
    # and then use that to create a new Turn class instance with the current
    # card and the guess as its arguments. then should be able to use turn methods
# should be able to keep track of the number of answers that are correct
# should be able to track the number of turns taken
# should be able to keep track of the number correct by category
# should be able to tell the percent of turns that have been correct
# should be able to tell the percent correct by category

# shuffle could be a useful method

require 'rspec'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        expect(round).to be_a(Round)
    end

    it 'can track turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'can read the current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)
        expect(round.current_card).to eq(card_1)
    end
    
    it 'can take a turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        new_turn = round.take_turn('Juneau')
        
        expect(new_turn).to be_a(Turn)
    end

    it 'can check if a taken turn is correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        new_turn = round.take_turn('Juneau')
        
        expect(new_turn.correct?).to eq(true)
    end

    it 'can keep track of a turn taken' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn = round.take_turn('Juneau')

        expect(round.turns).to eq([new_turn])
    end

    # next step is working on the number correct method 11/30/23

    it 'can move to the next card after turn is taken' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn1 = round.take_turn('Juneau')

        expect(round.current_card).to eq(card_2)
    end

    it 'can keep track of how many turns have been correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn1 = round.take_turn('Juneau')

        expect(round.number_correct).to eq(1)

        new_turn2 = round.take_turn("Mars")

        expect(round.number_correct).to eq(2)

        new_turn3 = round.take_turn("wrong answer")

        expect(round.number_correct).to eq(2)
    end

    it 'can count how multiple turns taken' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn1 = round.take_turn('Juneau')

        expect(round.turns.count).to eq(1)

        new_turn2 = round.take_turn("Mars")

        expect(round.turns.count).to eq(2)
    end
    
    it 'can provide feedback on the last turn taken' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn1 = round.take_turn('Juneau')

        expect(round.turns.last.feedback).to eq('Correct!')

        new_turn2 = round.take_turn("Jupiter")

        expect(round.turns.last.feedback).to eq('Incorrect!')
    end

    it 'can tell the number correct by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn1 = round.take_turn('Juneau')

        new_turn2 = round.take_turn("Mars")

        expect(round.number_correct_by_category(:STEM)).to eq(1)

        new_turn3 = round.take_turn("North north west")

        expect(round.number_correct_by_category(:STEM)).to eq(2)
        expect(round.number_correct_by_category(:Geography)).to eq(1)
        expect(round.number_correct_by_category("pop-stars")).to eq(0)
    end

    it 'can tell the percent of correct turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn1 = round.take_turn('Juneau')

        expect(round.percent_correct).to eq(100.0)

        new_turn2 = round.take_turn("Mars")

        expect(round.percent_correct).to eq(100.0)

        new_turn3 = round.take_turn("wrong answer")

        expect(round.percent_correct).to eq(66.7)
    end

    it 'can tell the percent of correct turns by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        new_turn1 = round.take_turn('Juneau')

        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)

        new_turn2 = round.take_turn("Mars")

        expect(round.percent_correct_by_category(:STEM)).to eq(100.0)

        new_turn3 = round.take_turn("wrong answer")

        expect(round.percent_correct_by_category(:STEM)).to eq(50.0)
    end 
end