# require_relative 'card' 
# lib/card.rb
# pry into the code
# instantiate card
# do research on coding directories and how to interact 
# with the terminal
# what is the difference between . and .. , why do i need
# /

class Turn
    attr_reader :guess
    attr_reader :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def guess
        @guess 
    end

    def correct?
        #returns boolean if guess matches answer on card
        # require 'pry'; binding.pry
        # @card == @answer
        @guess == card.answer 
    end

    def feedback
    end
end

