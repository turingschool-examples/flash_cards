require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


puts ' _____ _  _ ___    ___   _   __  __ ___'
puts '|_   _| || | __|  / __| /_\ |  \/  | __|'
puts '  | | | __ | _|  | (_ |/ _ \| |\/| | _|'
puts '  |_| |_||_|___|  \___/_/ \_\_|  |_|___|'
puts '~Flashcard-based Game of Wit and Wonder~'

# Instantiating objects in play
card1 = Card.new('Given x = 13 and y = 2, what is the result of x to the power of y?',
'169', :Math)
card2 = Card.new('What is the capital of US state of Indiana?', 'Indianapolis', :Geography)
card3 = Card.new('Fill in the blank: In the US, the ___ of Rights is a section of the Constitution that guarantees the rights and liberties for an individual.',
"Bill", :Civics)

cards = [card1, card2, card3]
deck = Deck.new(cards)

round = Round.new(deck)

# Starting the round
round.start
