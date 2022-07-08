require './lib/card'
require 'pry';

class Turns
    attr_reader :string, :card, :guess
    def initialize(string, card, guess)
        @string = string
        @card = card
        @guess = guess

    end


    def guess
            binding.pry

        guess == 'Juneau'"
    end
end