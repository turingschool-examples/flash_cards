# round.rb - define the Round class

class Round
    attr_reader :deck, :turns, :current_card, :current_card_index
    #Note: I wanted to make current_card_index fully internal to Round, but it is needed at one point externally

    def initialize(deck)
        @deck = deck

        #Track the current card in the deck via an integer index.  May be unneeded later.
        @current_card_index = 0

        # @current_card = deck[@current_card_index]
        @current_card = deck.cards[@current_card_index]

        @turns = []
    end

    #Other methods

    def take_turn(guess)
        #Create turn instance, given user's input into 'guess' string
        # turns << Turn.new(guess, @current_card)
        new_turn = Turn.new(guess, @current_card)
        @turns << new_turn

        #Provide feedback to user
        new_turn.feedback()

        #Advance to the next card in the deck before returning
        @current_card_index += 1
        @current_card = deck.cards[@current_card_index]

        return new_turn
    end

    def number_correct()
        #Determine the number of correct guesses (<= number of turns)
        #Iterate through turns and keep a running tally
        total_correct = 0

        turns.each do |turn|
            if turn.correct?()
                total_correct += 1
            end
        end

        #Alternate: could make if logic more compact if I can convert boolean to integer, i.e.:
        # total_correct += (convert to int) turn.correct?()

        return total_correct
    end

    def number_correct_by_category(category)
        #Iterate through turns and tally total correct for the specified category
        #Aside: this method and number_correct() methods are very similar...almost wasteful for memory.
        total_correct = 0

        turns.each do |turn|
            #Aside: Order of operations important...is best practice to overuse ()s to help others follow?
            if turn.correct?() && (turn.card.category == category)
                total_correct += 1
            end
        end

        return total_correct
    end

    def percent_correct()
        #Determine number correct guesses divided by total guesses (i.e. turns)
        #Note: I typically express percents as a decimal (math), but my guess is this project wants out of 100
        #Another note: it appears it wants one decimal of precision for rounding, hence the round(1) below
        #Yet another note: I had to force an int -> float conversion even though I thought the * 100.0 would imply it...
        (number_correct() / count_turns().to_f * 100.0).round(1)
    end

    def percent_correct_by_category(category)
        #Similar observation to number_correct_by_category() method before...
        (number_correct_by_category(category) / count_turns(category).to_f * 100.0).round(1)
    end

    def start()
        #Start the round for the game - introduction + begin with first card
        puts "\nWelcome!  You're playing with #{deck.count()} cards."
        puts "------------------------------------------------------"
        #Alternate to above: run a loop printing '-' at a time

        #QUESTION: where to build the taking turns logic?  Here?  Or the runner file?

    end

    def finish()
        #Complete the round and print out results
        puts "****** Game Over! ******"
        puts "You had #{number_correct()} correct guesses out of #{deck.count()} for a total score of #{percent_correct()}%."
        
        #Hard part: figure out what categories even exist.  Hacky workaround for now, manually run the known categoeies based on runner file (ugh).
        puts "STEM - #{percent_correct_by_category(:STEM)}% correct"
        puts "Turing Staff - #{percent_correct_by_category(:Turing_staff)}% correct"
        puts "Pop Culture - #{percent_correct_by_category(:Pop_culture)}% correct"
    end

    def count_turns(category_to_count = nil)
        #Count the total number of turns for a given category (or just overall total if not specified)
        #Note: could count total in deck, but this is more flexible as it could be called mid-game for real-time status!
        #Question: is it good practice to group these together, or make two methods?  This one is more flexible, but 'beefier'
        if category_to_count == nil
            return turns.length
        else
            total = 0
            turns.each do |turn|
                if turn.card.category == category_to_count
                    total += 1
                end
            end
            return total
        end
    end

end
