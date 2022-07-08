require './lib/card'
require 'pry';

class Turn
    attr_reader :string, :card, :guess
    def initialize(string, card, guess)
        @string = string
        @card = card
        @guess = guess
    end
    
 



end