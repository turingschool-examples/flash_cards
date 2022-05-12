require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

card1 = Card.new("Who is the captain of the strawhat pirates", 'Luffy', :Anime)
card2 = Card.new("Who is the main character in Demon slayer?", 'Tanjiro', :Anime)
card3 = Card.new("What bear is best?", "Black bear", :The_Office)
card4 = Card.new('What is the end of this phrase bears, beets?', "Battle star galactica", :The_Office)
cards = [card1, card2, card3, card4]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
