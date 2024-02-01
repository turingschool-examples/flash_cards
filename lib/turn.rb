# turn.rb

require './lib/card.rb'

class Turn

    attr_reader :string, :card

    def initialize (string, card)
        @string = string
        @card = card
    end

end