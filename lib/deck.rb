
class Deck
  attr_reader :cards
    def initialize(cards)
        @cards = cards

    end



    def count
       @cards.length
    end

    #This method works by setting card_category to an empty array. It then
    #uses the enumerable .each to iterate over each individual card in the array cards.
    #|card| in the pipes represents one card in the card array. cards.each do is iterating over |card| to pull out each
    #individual card. If the category (defined as an instance varaible in card.rb) is then equal to the category on each
    #individual card in the card.category method, then we can shovel that category instance (i.e. Geography) to the empty
    #card_category array. After the if statement, card_cateogy << card, is now shoveling card, or :Geography, :STEM, etc.
    #into the empty array, cards_category
    def cards_in_category(category)
      card_category = []
        cards.each do |card|
          if category == card.category
            card_category << card
          end

    end
        card_category
    end
end
# alternative method the .each method above
# cards.select { |card| card.category == category }
# I don't fully understand how this method works, so I didn't use it. But,
# I wrote it here as a reference for the future.
