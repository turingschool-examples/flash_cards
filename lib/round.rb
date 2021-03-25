class Round
    attr_reader :deck
                #:current_card
    def initialize(deck)
      #require './lib/deck'
      @deck = deck
      #not understanding why this doesn't work, going to bed about it
      #@current_card = deck(0)
    end
  end
