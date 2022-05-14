require './lib/helper.rb'
require './flashcard_runner.rb'

cards = CardGenerator.new('cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)
FlashcardRunner.new(round, deck, cards).start

# FlashcardRunner.new(round, deck, cards).start
