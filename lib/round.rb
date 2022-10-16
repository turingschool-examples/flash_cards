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
            return num_correct.count  
            end       
       end  
    end 

    def number_correct_by_category(category)
         
         

    end 

    
  
end 