require './lib/round.rb'
require './lib/card'
require './lib/deck.rb'
require './lib/turn'
#require 'pry'; binding.pry

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        expect(round.round_deck).to eq deck
    end

    it 'can display current card' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)


        expect(round.current_card).to eq (card_1)
        
    end

    it 'can do a turn' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.take_turn('answer_1')

        expect(round.number_correct).to eq 1 #new_turn = round.take_turn(player guess)
    end

    it 'can display a new current card after a turn' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.take_turn('answer_1')

        expect(round.current_card).to eq (card_2)
        
    end

    it 'stores the turn taken in the turns object' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.take_turn('answer_1')
        
        expect(round.turns.count()).to eq 1
    end

    it 'can do a turn and be wrong' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.take_turn('an1')

        expect(round.number_correct).to eq 0 #new_turn = round.take_turn(player guess)

    end

    it 'keeps track of turns taken' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        round.take_turn('answer_1')

        expect(round.turns.count).to eq 1

        round.take_turn('snawer_1')

        expect(round.turns.count).to eq 2

    end

    it 'tracks correct and incorrect' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)

        #correct
        round.take_turn('answer_1')
        # require 'pry'; binding.pry
        expect(round.number_correct).to eq 1
        #incorrect
        round.take_turn('answer_1')
        expect(round.number_correct).to eq 1
        #correct again
        round.take_turn('answer_1')
        expect(round.number_correct).to eq 2

    end

    it 'tracks correct by category' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        card_4 = Card.new('question_4', 'answer_4', :STEM)

        cards = [card_1, card_2, card_3, card_4]

        deck = Deck.new(cards)

        round = Round.new(deck)

        #correct
        round.take_turn('answer_1')
        #correct 
        round.take_turn('snawer_1')
        #correct stem
        round.take_turn('answer_1')
        #incorrect stem
        round.take_turn('answer_2')

        expect(round.number_correct_by_category(:Geography)).to eq 1
        expect(round.number_correct_by_category(:STEM)).to eq 2

    end

    it 'can give percentage correct' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        card_4 = Card.new('question_4', 'answer_1', :STEM)

        cards = [card_1, card_2, card_3, card_4]

        deck = Deck.new(cards)

        round = Round.new(deck)

        #correct
        round.take_turn('answer_1')
        #correct stem
        round.take_turn('snawer_1')
        #correct stem
        round.take_turn('answer_1')
        #incorrect stem
        round.take_turn('answer_2')
        # require 'pry'; binding.pry
        round.number_correct
        
        expect(round.percent_correct).to eq 75.0

    end

    it 'can give percentage correct by category' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        card_4 = Card.new('question_4', 'answer_1', :STEM)

        cards = [card_1, card_2, card_3, card_4]

        deck = Deck.new(cards)
        round = Round.new(deck)

        #correct
        round.take_turn('answer_1')
        #correct stem

        round.take_turn('snawer_1')
        #correct stem
        round.take_turn('answer_1')
        #incorrect stem
        round.take_turn('answer_2')

        expect(round.percent_correct_by_category(:Geography)).to eq 100.0
        expect(round.percent_correct_by_category(:STEM)).to eq 66.7


    end

    
end