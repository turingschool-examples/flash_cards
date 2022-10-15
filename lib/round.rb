class Round
    attr_reader :deck, :current_card, :turns 

    def initialize(deck)
        @deck = deck
        @turns = []
        # @current_card = deck.cards[0]
        @current_card = []
        @deck_size = deck.cards.length
    end

    def current_card
        @current_card = deck.cards[0]
    end


    # method is a behaviour

    # def take_turn(guess_string)
    #     @turn = Turn.new(guess_string, card)
    # end

    # def turns
    #     turns = []
    # end

    # def current_card
    #     deck.cards[0]
    # end

    def take_turn(guess)
        # require 'pry'; binding.pry
        turn = Turn.new(current_card, guess)
        @turns << turn
        # require 'pry'; binding.pry
        deck.cards.shift
        return turn
    
    end

    def number_correct
        score = 0
        turns.each do |turn|
            if turn.correct?
                score += 1
            end
            # require 'pry'; binding.pry
        end
        score
    end



    def number_correct_by_category(category_feedback)
        score_by_category = 0
        turns.each do |turn|
            # require 'pry'; binding.pry
            if turn.card.category == category_feedback && turn.correct?
                score_by_category += 1
            end


        end
        score_by_category

    end

    def percent_correct
        # number_correct divided by @turns
        (number_correct / turns.length.to_f) * 100
        # require 'pry'; binding.pry
        # require 'pry'; binding.pry
    end

    def percent_correct_by_category(category_feedback)


        # require 'pry'; binding.pry
        # number_correct_by_category(category_feedback) / 
        score_by_category_percent = 0
        turns.each do |turn|
            # require 'pry'; binding.pry
            if turn.card.category == category_feedback
                score_by_category_percent += 1
            end


        end
        # score_by_category
        (number_correct_by_category(category_feedback).to_f / score_by_category_percent) * 100






        # score_percent_by_category = 0
        # turns.each do |turn|

        #     require 'pry'; binding.pry
        # what is this doing
        # if turn.card.category == category_feedback
        # sees how many turn categories match category_feedback
        # calls.percent correct on 
        # number_correct_by_category(category_feedback)
        # end

    end


      


    
    def start

        # deck_size = deck.cards.length

        
        # puts "Welcome!"
        puts " Welcome! You're playing with #{@deck_size} cards."
        puts "-------------------------------------------------"
        puts "This is card number 1 out of 4."
        puts "#{deck.cards[0].question}"
        
        # require 'pry'; binding.pry
    end




    def complete
        puts "****** Game over! ******"
        puts "You had 3 correct guesses out of 4 for a total score of 75%."
        # require 'pry'; binding.pry
        final_score_categories = []
        turns.each do |turn|
            # require 'pry'; binding.pry
            final_score_categories << turn.card.category
            # require 'pry'; binding.pry
            # puts "#{turn.card.category} - #{percent_correct_by_category.to_i} correct"
        end
        # require 'pry'; binding.pry
        final_score_categories.uniq.each do |ctgrs|
            # require 'pry'; binding.pry
            puts "#{ctgrs} - #{percent_correct_by_category(ctgrs).to_i}% correct"
        end
        

        

        # puts "#{final_score_categories.uniq[0]} - #{percent_correct_by_category(final_score_categories.uniq[0]).to_i}% correct"

    end

   



    # The take_turn method takes a string representing the guess. 
    # take_turn method should create a new Turn object with the apropriate guess and Card. 
    # take_turn method should store this new Turn, as well as return the new Turn from the take_turn method. 
    # When the take_turn method is called, the Round should move on to the next card in the deck.
end
