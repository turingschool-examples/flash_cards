class Deck

    attr_reader :cards, :soda

    def initialize(cards, soda)
        @cards = cards #cards should be an array
        @soda = soda
    end
end