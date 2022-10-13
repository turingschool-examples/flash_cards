require './card'

require './turn'

require './deck'

class Round
    attr_reader :deck, :turns, :number_correct, :turns_taken, :correct_cards
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0.0
        @turns_taken = 0.0
        @correct_cards = []
    end

    def current_card
        current_card = @deck.cards
        current_card[turns.count]
    end

    def take_turn(guess)

        @turns.push Turn.new(guess, current_card)
        if
            @turns.last.card.answer.downcase == @turns.last.guess.downcase
            @number_correct += 1.0
            @correct_cards.push self.turns.last
        end
        @turns_taken += 1.0
        return @turns.last

    end

    def number_correct
        @number_correct
    end

    def number_correct_by_category(category)

        @category_correct_amount = 0.0

        @correct_cards.each do |correct_card|
            if
                correct_card.card.category.downcase == category.downcase
                @category_correct_amount += 1.0
            end
        end
        @category_correct_amount
    end

    def percent_correct

        @number_correct / @turns_taken * 100.0
    end

    def percent_correct_by_category(category)

        @category_asked_amount = 0.0
        @category_correct_amount = 0.0

        @correct_cards.each do |correct_card|
            if
                correct_card.card.category.downcase == category.downcase
                @category_correct_amount += 1.0
            end
        end

        @turns.each do |turn|
            if 
                turn.card.category.downcase == category.downcase
                @category_asked_amount += 1.0
            end
        end

        @category_correct_amount / @category_asked_amount * 100.0
    end

    def card_number
        @turns_taken.round + 1
    end


end