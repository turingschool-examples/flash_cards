class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_number = 0
        @correct_turns = 0
    end

    def current_card
        return @deck.cards[@card_number]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns.push(turn)
        @card_number += 1
        return turn
        
    end

    def number_correct
        correct_count = 0
        counter = 0
    loop do
        if @turns[counter].correct? == true
            correct_count += 1
        end
        
        counter += 1

        if turns.length == counter
            break
        end
        
    end
        return correct_count
        
    end

def number_correct_by_category(category)
    correct_count = 0
    counter = 0

    loop do
        if @turns[counter].correct? == true && @turns[counter].card.category == category
            correct_count += 1
        end
        
        counter += 1

        if turns.length == counter
            break
        end
        
    end
        return correct_count

end

def percent_correct

    percentage = ((number_correct.to_f / @turns.count) * 100).round

end

def percent_correct_by_category(category)
    total_number = 0
    counter = 0

    loop do
        if @turns[counter].card.category == category
            total_number += 1
        
        end  
    counter += 1
    if turns.length == counter
        break
    end
end
    
   return percentage = ((number_correct_by_category(category).to_f / total_number) * 100).round

    # getting the amount of turns correct by category and then divide it by the amount of turns in that category, then multiply by 100 and round to nearst decimal point

end

end