require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

class Start

    attr_reader :round

    def initialize(round)
        @round = round
    end
end