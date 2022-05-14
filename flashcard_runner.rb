require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)
card_2 = Card.new("Question: What is the tallest mountain in the world?", "Mount Everest", :Geography)
card_3 = Card.new("Question: Which organ do insects not have?", "Lungs", :STEM)
card_4 = Card.new("Question: What African country serves as the setting for Tatooine in Star Wars?", "Tunisia", :Geography)
card_5 = Card.new("Question: What is the smallest country?", "Vatican City", :Geography)
card_6 = Card.new("Question: Who has won more tenis grand slam titles, Venus Williams or Serena Williams?", "Serena Williams", :Sports)
cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
