class Round
    attr_reader :deck, :turns, :current_card, :take_turn
    def initialize(deck)
        @deck = deck
        @turns = []
        @turns_taken = 0
        @current_card = current_card
        @take_turn = take_turn
    end
    def current_card
        @deck.cards[@turns_taken]
        # if turns == []
        #     first_card = deck.map{|deck|deck.drop(card_2, card_3)}
        #     first_card.take_turn
        # elsif #need second condition here
        #     second_card = deck.map{|deck|deck.drop(card_1, card_3)}
        #     second_card.take_turn
        # third_card = deck.map{|deck|deck.drop(card_1, card_2)}
        #     third_card.take_turn
        end
    end
    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        if new_turn.correct?
            @number_correct += 1
            @turns_taken += 1
            new_turn
        end
    end
        #records appropriate guess and card to 'turns' method
        #round should move onto next card in the deck
    # end
    def turns
        #turns = deck.map do {|deck| deck.take_turn}
    end
    def correct?
        if guess == answer
        end
    end
    def number_correct
        correct_answers = []
    end
    def number_correct_by_category(category)
        #match which card categories were given correct response
    end
    def percent_correct
        #will give back percent of correct answers
    end
    def percent_correct_by_category(category)
        #explanatory
    end
end