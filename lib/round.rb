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
        @deck.cards[0]

    end

    def take_turn(guess)
        @guess = guess
        @turns.push Turn.new("#{guess}", self.current_card)
        if
            @turns.last.card.answer.downcase == @turns.last.guess.downcase
            @number_correct += 1.0
            @correct_cards.push self.turns.last
        end
        @turns_taken += 1.0
        @deck.cards.shift
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
        @turns_taken += 1
        @turns_taken.round
    end


end