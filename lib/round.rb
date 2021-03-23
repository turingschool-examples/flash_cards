class Round
    attr_reader :deck, :turn, :turns

    def initialize(deck)
        @deck = deck
        @card = @deck.cards.first
        @turns = []
    end

    def start
        pp @card.question
        take_turn(gets.chomp)
    end

    def take_turn(guess)
        @turn = Turn.new(guess, current_card)
        @turns << @turn
        if @card = @deck.cards[@deck.cards.index(@card)+1]
        else 
            puts "No more cards"
        end
    end

    def current_card
        @card
    end

    def number_correct
        @turns.select{|turn| turn.correct?}.length
    end

    def number_correct_by_category(category)
        t = @turns.select{ |turn| turn.correct?}
        t.select{|turn| turn.card.category == category}.length
    end

    def percent_correct
        (number_correct.to_f / turns.length.to_f) * 100
    end

    def percent_correct_by_category(category)
        l = @turns.select{|turn| turn.card.category == category}.length
        (number_correct_by_category(category).to_f / l.to_f) * 100
    end
end