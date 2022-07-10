require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'

class CardGenerator

    attr_reader :filename

    def initialize(filename)
        @filename = filename

    end

    def pull_card
    end

end