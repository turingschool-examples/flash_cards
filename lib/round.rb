class Round 
    attr_reader :deck, :turns, :correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @correct = 0
    end     
    
    def current_card
        @deck.cards.first
    end 

    def take_turn(guess)
        if guess == current_card.answer
            @correct += 1 
        end 
        @turns << Turn.new(guess, current_card)
        @deck.cards = @deck.cards.rotate(1)
        @turns.last
    end 

    def number_correct
        @correct
    end 

    def number_correct_by_category(category)
        @correct_count = 0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct? == true
                @correct_count += 1
            end 
        end 
        @correct_count 
    end 

    def percent_correct
        (number_correct / turns.count.to_f) * 100
    end 

    def percent_correct_by_category(category)
        total_correct_by_category = 0
        turns.each do |turn|
            if turn.card.category == category 
                total_correct_by_category +=1
            end 
        end 
        (number_correct_by_category(category) / total_correct_by_category.to_f)*100 
    end     
end 