require './lib/card'
require './lib/turn'
require './lib/deck'
# require 'pry'; binding.pry


class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, @deck.cards[0])
        @turns.push(new_turn) 
        @deck.cards.shift
        new_turn
        
       
        
    end

    def number_correct
        correct_answers = 0
        @turns.each do |turn|
            if turn.correct? == true then correct_answers += 1
            end
        end
        correct_answers
    end




end