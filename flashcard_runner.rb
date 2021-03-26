require './lib/game'

@card1 = Card.new('What is the capital of CO?', '1', :Geography)
@card2 = Card.new('What is the captial of Mexico?', '2', :Geography)
@card3 = Card.new('What is the boiling point (degrees celcius) of water?', '3', :Science)
@card4 = Card.new('What position did Satchel Paige play?', '4', :Sports)
@card5 = Card.new('What element is abbreviated as Cl?', '5', :Science)
@cards = [@card1, @card2, @card3, @card4, @card5]
@deck = Deck.new(@cards)

game = Game.new(@deck)
game.start
