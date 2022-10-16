class Turn

    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        @guess.downcase == card.answer.downcase || (close_enough? && similar_length?)
    end

    def feedback
        correct? ? "Correct!\n" : "Incorrect.\n"
    end

    def close_enough?
        (@guess.downcase.chars - card.answer.downcase.chars).length <= 2 && 
        (card.answer.downcase.chars - @guess.downcase.chars).length <= 2
    end

    def similar_length?
        (@guess.length - card.answer.length).abs <= 1
    end

end

