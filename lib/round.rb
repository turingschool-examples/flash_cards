    #require './lib/turn' #in order form my Round class to work I need to access 
                        #my Turn class

    class Round #creating my Round class 
        attr_reader :deck, :turns, :current_card, :number_correct #here I am creating my attribute reader
        
        def initialize(deck) #Here I am initialzing my attributes and calling in my deck as a parameter which contains my cards which contains my card (question, answer, :category)
            @deck = deck 
            @turns = [] #I am initializing my turns while creating an empty array
            @current_card = @deck.cards.first #I am initializing my current_card while 
            @number_correct = 0 #setting number_correct to = 0
        end

        def take_turn(guess) #defining my take_turn(passing guess instance as parameter)
            turn = Turn.new(guess, current_card) #instantiating Turn object, creating a new Turn instance with (guess, current_card as parameters)
            @turns << turn
            @number_correct += 1 if turn.correct?
            @current_card = @deck.cards[@turns.count]  
            turn
        end

        def number_correct_by_category(category)
            @turns.count { |turn| turn.card.category == category && turn.correct? }
        end

        def percent_correct
            return 0.0 if @turns.count == 0
            (@number_correct.to_f / @turns.count * 100).round(1)
        end   
        
        def percent_correct_by_category(category)
            total_in_category = @turns.count { |turn| turn.card.category == category } #|block| variable
            correct_in_category = number_correct_by_category(category)
            return 0.0 if total_in_category == 0
            (correct_in_category.to_f / total_in_category * 100).round(1)
        end
    end