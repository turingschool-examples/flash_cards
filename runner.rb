require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Who was the first Disney princess?", "Persephone", :Pop_Culture)
card_2 = Card.new("Who created Mickey Mouse?", "Walt Disney & Ub Iwerks", :Pop_Culture)
card_3 = Card.new("Who originally sang the song 'I Love Rock 'N Roll'?", "Arrows", :Pop_Culture)
card_4 = Card.new("Who was the lead singer of the 1980's group Culture Club?", "Boy George", :Music)
card_5 = Card.new("Which singer's real name is Robyn Fenty?", "Rihanna", :Music)
card_6 = Card.new("Which pop star played 27 different instruments on their debut album For You?", "Prince", :Music)
card_7 = Card.new("Janis Joplin, Jimi Hendrix, Jim Morrisson, and Kurt Cobain were all what age when they died?", "27", :Music)

deck = Deck.new(card_1, card_2, card_3, card_4, card_5, card_6, card_7)

round - Round.new(deck)

card_number = @turns.count + 1

p "Welcome! You're  playing with #{deck.cards.count} cards."
p "-------------------------------------------------"
p "This is card number #{card_number} out of #{deck.cards.count}."
p "Question: #{card_1.question}"
