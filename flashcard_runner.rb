require './lib/game'

# @card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
# @card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
# @card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
# @card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
# @card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
# @cards = [@card1, @card2, @card3, @card4, @card5, @card6]
# @deck = Deck.new(@cards)



game = Game.new(@deck)
game.start
