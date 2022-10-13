require './card'

require './turn'

require './deck'

class Round
    attr_reader :deck, :turns, :number_correct, :turns_taken, :correct_cards
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @turns_taken = 0
        @correct_cards = []
        @catogory_correct_amount = 0
    end

    def current_card
        @deck.cards[0]

    end

    def take_turn(guess)
        @guess = guess
        @turns.push Turn.new("#{guess}", self.current_card)
        if
            @turns.last.card.answer == @turns.last.guess
            @number_correct += 1
            @correct_cards.push self.turns.last
        end
        @turns_taken += 1
        @deck.cards.shift
        return @turns.last

    end

    def number_correct
        @number_correct
    end

    def number_correct_by_category(category)

        @category_correct_amount = 0

        @correct_cards.each do |correct_card|
            if
                correct_card.card.category == category
                @category_correct_amount += 1
            end
        end
        @category_correct_amount
    end

end