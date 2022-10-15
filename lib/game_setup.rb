require './lib/card'
require './lib/deck'
require './lib/round'

  # HARD CODED CARDS
  # card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  # card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  # card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  # card_4 = Card.new("Presto, largo, allegro relate to what property of music?" , "Tempo", :Music)
  # card_5 = Card.new("What is 5 * 5?", "25", :Math)
  # card_6 = Card.new("What color is Mario's hat?", "Red", "Video Games")
  # card_7 = Card.new("Who is Master Chief's A.I.?", "Cortana", "Video Games")
  # deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7])


  
  @round = Round.new(deck)
