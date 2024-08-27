class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
       
        
    end

    def current_card 
         deck.cards.first
    end

     

    def take_turn(guess)
        card = deck.cards.shift #shift returns first thign in an array
        turn = Turn.new(guess, card)
        @turns << turn
        turn
        

    end

    def number_correct
      @turns.count { |turn| turn.correct? } #count goes over every 'turn' and runs the code in curly brace on it
     end
    
    def number_correct_by_category(category)
        @turns.count do |turn| 
            turn.correct? && turn.card.category == category #if both are true it counts as a correct turn in the category
        end
    end
     

    def percent_correct
      return 0.0 if @turns.empty?
      num_of_correct = @turns.count { |turn| turn.correct? }
      (num_of_correct.to_f / @turns.count) * 100 #number of correct turns to float divided by total turns
    end

    def percent_correct_by_category(category)
        return 0.0 if @turns.empty?
        correct_by_category =  @turns.count { |turn| turn.correct? && turn.card.category == category }#if both are true it counts as a correct turn in the category
        total_category_turns = @turns.count { |turn| turn.card.category == category } #counting all turns in cateogry, if it fits the criteria in curly braces (catefgory)it is counted
        return 0.0 if total_category_turns.zero? #does what it says

        (correct_by_category.to_f / total_category_turns) * 100
    end

        

end