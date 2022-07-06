class Card
    attr_reader :question, :answer, :category
    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end
end

class Turn
    attr_reader :guess, :card
    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        guess == card.answer
    end

    def feedback
        return "Correct!" if correct? == true
        return "Incorrect." if correct? == false
    end
end

class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def count
        cards.count
    end
end