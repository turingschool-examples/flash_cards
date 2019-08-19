
card_1 = Card.new("What is the tallest mountain in the world?", "Everest", :Geography)
card_2 = Card.new("What is the tallest mountain in North America?", "Denali", :Geography)
card_3 = Card.new("Who created the first computer program?", "Ada Lovelace", :STEM)
card_4 = Card.new("Who created the first computer?", "Charles Babbage", :STEM)
card_5 = Card.new("Who directed the movie Pulp Fiction", "Quentin Tarantino", :Entertainment)
card_6 = Card.new("Who played Iron Man?", "Robert Downey Jr", :Entertainment)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]

deck = Deck.new(cards)

turn =

def start
  puts "Welcome! Youre're playing with 6 cards."
  puts "This is #{current_card} out of 6."
end
