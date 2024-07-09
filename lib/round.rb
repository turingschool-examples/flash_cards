class Round
    attr_reader :deck, :turns
   
    def initialize(deck)
        @deck = deck
        @turns = []
        @card_index = 0
        @correct_counter = 0
        @geo_counter = 0
        @STEM_counter = 0
    end

    def current_card
        card = @deck.cards[@card_index]
        return card
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @deck.cards.shift
        if new_turn.correct?
            @correct_counter += 1
        end

        return new_turn
    end

    def number_correct
        @correct_counter
    end

    def number_correct_by_category(category)
        #if category = stem && new_turn.correct? then STEM counter goes up
        #if category = geography && new_turn.correct? then geo counter goes up
        if
            @card.category == category && @new_turn.correct? && @card.category == :STEM
                @STEM_counter +=1

        else
            @card.category == category && @new_turn.correct? && @card.category == :Geography
                @geo_counter +=1 
        end
    end
end