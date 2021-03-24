# require 'colorize'
class Turn
    attr_accessor :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?()
        guess.downcase == @card.answer.downcase
    end

    def feedback()
        if correct?
            puts "Correct!".blue
        else
            puts "Incorrect.".red
        end
    end
end