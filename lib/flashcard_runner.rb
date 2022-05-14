require './card'
require './turn'
require './deck'
require './round'

  card_1 = Card.new("What is the capital of Greece?", "Athens", :Geography)
  card_2 = Card.new("What galaxy does our solar system belong to?", "Milky Way", :STEM)
  card_3 = Card.new("How many books were in the Harry Potter Series?", "7", :Pop_Culture)
  card_4 = Card.new("Who wrote the 1983 song 'Let's Dance'?", "David Bowie", :Pop_Culture)
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)

  round.start
