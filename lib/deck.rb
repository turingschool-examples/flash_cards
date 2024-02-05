class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.count
    end

    def cards_in_category(category)
       # we have a category
       # find cards with a particular category in this deck
       # need to find cards
       # search through cards for each card that matches this category
       # look through cards array
        # for each card:
        # does card's category equal the category we received up top
        # if it's yes:
            # add it to our return array
        # if it'ss no:
                    # do nothing
      
                    @cards.find_all do |cards|  
                        cards.category == category
                    end

    end
end