require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round
    attr_reader :deck 
    attr_reader :turns 
    

    def initialize(deck)
        @deck = deck 
        @turns = []
        @card_index = 0
    end

    def take_turn(guess)
        turn = Turn.new(guess, @deck.card_at(@card_index))
        @card_index += 1
        @turns << turn 
        return turn
    end


    def current_card
        @deck.card_at(@card_index)
    end

    def number_correct
        @turns.select {|turn| turn.guess == turn.card.answer }.count
    end

    def number_correct_by_category(category)
        @turns.select {|turn| turn.guess == turn.card.answer && turn.card.category == category}.count
    end
end


