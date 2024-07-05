class Round
    attr_accessor :deck,
                  :turns,
                  :number_correct,
                  :turn

    def initialize(deck)
        @deck = deck
        @turns = []
        @turn = 0
        @current_card = @deck.cards[@turn]
        @number_correct = 0
        set_correct_by_category
        set_category_count
    end

    def current_card
        @current_card = @deck.cards[@turn]
    end

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turn += 1
        @category_count[@current_card.category] = (@category_count[@current_card.category] += 1)
        if turn.correct?
            @number_correct += 1
            @correct_by_category[@current_card.category] = (@correct_by_category[@current_card.category] += 1)
        end
        turns.push(turn)
    end

    def percent_correct
        value = @number_correct.fdiv(@turn)
        value = value * 100
    end

    def set_correct_by_category
        @correct_by_category = Hash.new
        @deck.categories.each {|category| @correct_by_category[category] = 0 }
    end

    def set_category_count
        @category_count = Hash.new
        @deck.categories.each {|category| @category_count[category] = 0 }
    end

    def number_correct_by_category(category)
        @correct_by_category.fetch(category)
    end

    def percent_correct_by_category(category)
        value = @correct_by_category[category].fdiv(@category_count[category])
        value = value * 100
    end


end