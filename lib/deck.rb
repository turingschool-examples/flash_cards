class Deck
    # the attr reader is creating a getter for deck
    attr_reader :deck
    # The initialize method is calling one parameter called deck.
    # It then assigns the value to @deck
        def initialize(deck)
            @deck = deck
        end
        # This is our cards method. It is taking all of the cards from the @deck
        def cards
            @cards = @deck
        end
        # this is our count method. We are using the @deck instnace with the .count method to count how many cards are in the deck.
        def count
            @deck.count
        end
        # this is defining the card_in_category method. category is a argument that will be expected.
        def cards_in_category(category)
            # This is taking the entire @deck and selecting from the card specifically the category.
            # We are using te .select method on deck. This filters through the card for the category
            @deck.select{|card| card.category == category}
        end
end