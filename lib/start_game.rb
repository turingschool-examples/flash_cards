class ClassName
    def start
        card_1 = Card.new("Who is the best?", "Zeke", :Anime)
        card_2 = Card.new("Who won the super bowl?", "Tampa Bay", :Sports)
        cards = [card_1, card_2]
        deck = Deck.new(cards)
    end
end