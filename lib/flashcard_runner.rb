require './lib/card'
# require


@card_1 = Card.new("What is capital of Colorado?", "Denver", :Geography),
@card_2 = Card.new("Why do we have test tubes", "because", :STEM),
@card_3 = Card.new("Why do we run", "lose weight", :STEM)

@cards = [@card_1, @card_2, @card_3]

@deck = new.Deck(@cards)

@round = new.Round(@cards)
