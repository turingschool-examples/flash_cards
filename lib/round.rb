class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
    end 

    def current_card
        @current_card = deck.cards[0]
    end 

    def take_turn(guess)
        @turn = Turn.new(guess, current_card)
        @turns << @turn
        deck.cards.shift
        return @turn 
    end 

    def number_correct
        num_correct = []
         @turns.each do |completed_turn| 
            if completed_turn.correct? == true
                num_correct << completed_turn 
            end       
       end  
        num_correct.count
    end 

    def number_correct_by_category(category)
        num_correct_cat = []
        @turns.each do |completed_turn|
            if completed_turn.correct? == true and completed_turn.card.category == category
                num_correct_cat << completed_turn     
            end      
        end 
        num_correct_cat.count
       
    end 

    def percent_correct
        num_correct_per = []
        @turns.each do |completed_turn|
            if completed_turn.correct? == true
                num_correct_per << completed_turn
            end
        end
        # require 'pry'; binding.pry
        percent = (num_correct_per.count)/ (@turns.count).to_f
        "#{percent.round(3)}%"
    end 

    
  
end 