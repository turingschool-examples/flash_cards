
class Round 

    attr_reader :deck, :turns, :num_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @num_correct = []
 
end

def current_card
    @deck.cards[@turns.count]
end

def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if new_turn.correct?
        @num_correct << new_turn
    end
    new_turn
end

def number_correct
 @num_correct.count    
end


def number_correct_by_category(category)
@turns.each do |turn|
    if turn.correct? && turn.card.category == category
        @num_correct_in_category << turn
    end

end

@num_correct_in_category.count

end

end











