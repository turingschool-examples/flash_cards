class Round
    attr_reader :deck, :turns, :number_of_rounds, :number_correct, :card_categories, :total_correct_by_category
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_of_rounds = 0
        @number_correct = 0
        @card_categories = []
        @total_correct_by_category = Hash.new
    end

    def current_card
        @deck.cards.at(number_of_rounds)
    end

    def last_turn
        @turns.at((number_of_rounds)-1)
    end

    def answered_card
        @deck.cards.at((number_of_rounds)-1)
    end

    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        
        @turns << current_turn # move current turn into turns array

        if @number_of_rounds == 0
            add_categories_to_hash # if first turn, populates card categories with all categories in deck
        end
        
        @number_of_rounds += 1 # update rounds attribute

        if current_turn.correct? == true
            @number_correct += 1 # update correct answers attribute
            add_counter_category(0)
            add_counter_category(1)
        else
            add_counter_category(1)
        end

        return last_turn
    end

    def add_counter_category(position)
        @total_correct_by_category[answered_card.category][position] += 1
    end

    def listing_card_categories
        cards_processed = 0
        until cards_processed == @deck.count
            @card_categories << @deck.cards[cards_processed].category
            cards_processed += 1
        end
        @card_categories.uniq!
    end

    def add_categories_to_hash
        listing_card_categories
        @card_categories.each do |categ|
            @total_correct_by_category[categ] = [0,0]
        end
    end

    def percent_correct
        ((@number_correct * 100 / @number_of_rounds).to_s + ".0").to_f
    end

    def percent_correct_by_category(category)
        (@total_correct_by_category[category][0].to_f * 100) / 
        ((@total_correct_by_category[category][1].to_s + ".0").to_f)
    end

    def number_correct_by_category(category)
        @total_correct_by_category[category][0].to_i
    end

end
