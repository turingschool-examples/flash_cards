class Deck

    attr_reader :cards,
                :count,
                :category,
                :turn

            def initialize (cards)
                @cards = cards
            end
            
            def count
                cards.length
            end
            
            def cards_in_category(category)
                cards.select { |card| card.category == category}
              end
            
end