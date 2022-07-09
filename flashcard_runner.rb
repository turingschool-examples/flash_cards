require './lib/card'
require './lib/turn'
require './lib/deck'

card_1 = Card.new("What house is Harry Potter sorted into?", "Gryffindor", :HarryPotter)
card_2 = Card.new("What is Harry's position on the Quidditch team?", "Seeker", :HarryPotter)
card_3 = Card.new("How many staircases does Hogwarts have?", 142, :HarryPotter)
card_4 = Card.new("Who is the Half-Blood Prince?", "Snape", :HarryPotter)
card_5 = Card.new("What is the term used for the perimeter of a circle?", "Circumference", :Math)
card_6 = Card.new("What society invented the use of negative numbers?", "Chinese", :Math)
card_7 = Card.new("What is the name of the number system that has a base of two?", "Binary", :Math)
card_8 = Card.new("Which town was Leonardo da Vinci born in?", "Vinci", :Art)
card_9 = Card.new("What nationality was Picasso?", "Spanish", :Art)
card_10 = Card.new("Jerry Garcia is the lead singer for what group?", "Grateful Dead", :Music)
card_11 = Card.new("What is stored in a camel's hump?", "Fat", :Animals)
card_12 = Card.new("What color is a giraffe's tounge?", "Blue", :Animals)
card_13 = Card.new("Which is the world's largest lizard?", "Komodo Dragon", :Animals)
card_14 = Card.new("In which country is Timbuktu?", "Mali", :Geography)
card_15 = Card.new("What is the capitol of the state of Mississippi?", "Jackson", :Geography)

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10, card_11, card_12, card_13, card_14, card_15]
deck = Deck.new(cards)
