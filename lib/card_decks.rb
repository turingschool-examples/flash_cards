
require_relative 'card'
require_relative 'deck'

card1 = Card.new("What is the capital of Germany?", "Berlin", :national_capitals)
card2 = Card.new("What is the capital of Sweden?", "Stockholm", :national_capitals)
card3 = Card.new("What is the capital of Argentina?", "Santa Fe", :national_capitals)
card4 = Card.new("What is the capital of Brazil?", "Brasilia", :national_capitals)
card5 = Card.new("What is the capital of France?", "Paris", :national_capitals)
card6 = Card.new("What is the capital of Spain?", "Madrid", :national_capitals)
card7 = Card.new("What is the capital of Mexico?", "Mexico City", :national_capitals)
card8 = Card.new("What is the capital of Switzerland?", "Bern", :national_capitals)
card9 = Card.new("What is the capital of Japan?", "Tokyo", :national_capitals)
card10 = Card.new("What is the capital of Egypt?", "Cairo", :national_capitals)
card11 = Card.new("What is the capital of Morocco?", "Rabat", :national_capitals)
card12 = Card.new("What is the capital of Guatamala?", "Guatamala City", :national_capitals)

deck1 = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12])
