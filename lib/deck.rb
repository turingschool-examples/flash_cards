class Deck
    attr_reader :cards

def initialize(cards)
    @cards = cards
end

def count
    return @cards.length
end

def cards_in_category(category)
    return cards.select { |card| card.category == category  } #looping with an if statement rubydocs select
    end

# def cards_in_category(category)
#     card_count = 0
#     card_categories = []
#     loop do
#         if @cards[card_count].category == category
#             card_categories.push(@cards[card_count])
#         end
#         card_count += 1
#         if card_count == count
#             break
#         end
#     end
#     return card_categories
# end
# commented out because I had help with it


end