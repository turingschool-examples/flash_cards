require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = ("Who is the main character in One Piece", "Luffy", :Anime)
card_2 = ("Who is the Denver Nuggets star Center", "Nikola Jokic", :Sports)
card_3 = ("What city does Kanye West come from", "Chicago", :Pop_culture)
card_4 = ("CAn you name Spillage Village more current album?", "Spillgion", :Music)

deck = Deck.new([card_1, card_2, card_3, card_4])
round.start

puts "Welcome! You're playing with 4 cards."
puts "---------------------------------------------"
puts "This is card number 1 out of 4" 
