# round.rb - define the Round class

class Round
    attr_reader :deck, :turns, :current_card, :current_card_index, :all_categories
    #Note: I wanted to make current_card_index fully internal to Round, but it is needed at one point externally

    def initialize(deck)
        @deck = deck
        @current_card_index = 0     #Track the current card in the deck via an integer index.  May be unneeded later.
        @current_card = deck.cards[@current_card_index]
        @turns = []

        #This was especially fun for me to figure out :)
        #Determine all categories automatically from built deck
        @all_categories = []

        #NOTE 12/8/24 - this could optionally be moved to CardGenerator...
        deck.cards.each do |card|
            #Only add if it's new (I REALLY feel like an enumerable I don't know would help here...)
            # unique_categories = []
            is_repeated_category = all_categories.find do |check_category|
                check_category == card.category
            end
            if is_repeated_category == nil
                @all_categories << card.category
            end

            #I think this way would be even more compact...
            # if !all_categories.find { |check_category| == card.category}
            #     @all_categories << card.category
            # end
        end
    end

    def take_turn(guess)
        #Create turn instance, given user's input into 'guess' string
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
        (number_correct() / count_turns().to_f * 100.0).round(1)
    end

    def percent_correct_by_category(category)
        #Similar observation to number_correct_by_category() method before...
        #Note: this does not check if the category is valid, but code should be internally consistent to prevent from happening.
        (number_correct_by_category(category) / count_turns(category).to_f * 100.0).round(1)
    end

    def start()
        #Start the round for the game - introduction + begin with first card
        #This method is sparse, though in another version this could load the card data file...

        puts "\nWelcome!  You're playing with #{deck.count()} cards."
        puts "------------------------------------------------------"
    end

    def finish()
        #Complete the round and print out results
        puts "\n****** Game Over! ******"
        puts "You had #{number_correct()} correct guesses out of #{deck.count()} for a total score of #{percent_correct()}%."
        
        #Hard part: figure out what categories even exist to print.  Hacky workaround for now, manually run the known categoeies based on runner file (ugh).
        #Very hard version: deduce categories from existing symbols defined
        #Hard version: read in categories based on input file and construct array
        #Medium version: create array of categories manually on initialization
        # puts "STEM - #{percent_correct_by_category(:STEM)}% correct"
        # puts "Turing Staff - #{percent_correct_by_category(:Turing_staff)}% correct"
        # puts "Pop Culture - #{percent_correct_by_category(:Pop_culture)}% correct"

        #I figured out the hard way!  Mostly required some machinery in initialize()...
        #Iterate through all categories
        @all_categories.each do |current_cateogry|
            #May need to clean up "_"
            string_equivalent = current_cateogry.to_s.gsub("_", " ")
            puts "#{string_equivalent} - #{percent_correct_by_category(current_cateogry)}% correct"
        end

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
