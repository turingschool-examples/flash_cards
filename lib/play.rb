class Testing
    attr_accessor :deck

    def initialize(deck)
      @deck = deck
    end
end

hi = Testing.new("potato")
p hi.deck
