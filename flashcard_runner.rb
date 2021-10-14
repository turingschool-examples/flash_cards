card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the tallet mountain in the world?", "Mt. Everest", :Geography)
deck = Deck.new([card_1, card_2, card_3, card_4])

game = Game.new(deck)
game.start
answer = gets.chomp
game.check_answer
