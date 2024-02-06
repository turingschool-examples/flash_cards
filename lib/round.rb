require 'pry'
class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        
    end

    def current_card
        used_cards = []
        deck.each do |card|
         used_cards << @deck.cards.first
        end
        used_cards
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card) 
        @turns << turn
        turn
    end

    def number_correct
        # have a turn
        # have a card
        @turns.count {|turn| turn.correct?}
    end

    def number_correct_by_category
        binding.pry
        @turns
    end

    # def percent_correct
    #(@turns.count {|turn| turn.correct?}) % (@turns.count {|turns| turns.correct? != true})
    # end

    # def percent_correct_by_category

    # end
end