# round.rb

class Round

    @@card_counter = 0

    attr_reader :deck, :turns, :number_correct

    def initialize (deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        @deck.cards[@@card_counter]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        if new_turn.correct? == true
            @number_correct += 1
        end
        @@card_counter += 1
        @turns << new_turn
        new_turn
    end

    def number_correct_by_category(category)
        sorted_array = @turns        
        length = @@card_counter

        counter = 0
        number_correct = 0

        length.times do
            if sorted_array[counter].correct? && sorted_array[counter].card.category == category
                number_correct += 1
            end
            counter += 1
        end

        number_correct
    end

    def percent_correct
        number_correct = @number_correct
        count = @@card_counter
        percent_correct = ((number_correct.to_f / count.to_f) * 100).round(1)
    end

    def percent_correct_by_category(category)
        cards_in_cat = @deck.cards_in_category(category).length

        number_correct = number_correct_by_category(category)
        count = cards_in_cat
        percent_correct = ((number_correct.to_f / count.to_f) * 100).round(1)
    end

end