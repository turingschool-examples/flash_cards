require 'pry'

class Round
    attr_reader :deck, :turns, :correct_answer
    def initialize(deck)
        @deck = deck
        @turns = []
        @correct_answer = 0
    end

    def current_card; @deck.cards.first end

    def take_turn(guess)
        @turns << Turn.new(guess, current_card)
        @deck.cards.rotate(1)
        @turns.last
    end

    def number_correct
        @turns.each do |turn|
            @correct_answer += 1 if turn.correct? == true
        end
        @correct_answer
    end


end