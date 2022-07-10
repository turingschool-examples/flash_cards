class Round
        attr_reader :deck, :turns, :number_correct

    def initialize(deck)
         @deck = deck
         @turns = []
         @correct_responses = []
    end


   def current_card
    deck.cards.first
   end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        @deck.cards.shift
        turn
     end

    def number_correct
        turns.select do |turn|
            if turn.correct? == true
                @correct_responses << turn
            end
        end
        @correct_responses.length
    end

    def number_correct_by_category(category)
        @correct_responses.select do |correct_response|
            correct_response.card.category == category
        end.length
        
       
    end

   

end



