require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'



card_1 = Card.new("Which 1997 film stars Nicolas Cage, John Cusack, and John Malkovich?",
"CON AIR", :MOVIES)
card_2 = Card.new("What type of galaxy is the most common in the universe?",
  "ELLIPTICAL", :SCIENCE)
card_3 = Card.new("What year was Forrest Gump released?", 1994, :MOVIES)
card_4 = Card.new("How many billions of years old is the universe?", 13.8, :SCIENCE)
card_5 = Card.new("What year was the song “My Heart Will Go On” from Titanic released?",
1994, :MOVIES)
card_6 = Card.new("How many planets are in the Solar System?", 8, :SCIENCE)

@cards = [card_1, card_2, card_3, card_4, card_5, card_6]
@deck = Deck.new(@cards)
round_1 = Round.new(@deck)


def start(round)
  total_cards = round.deck.cards.count
  puts "Welcome!, You're playing with #{total_cards} cards!"
  puts "-" * 50
    round.deck.cards.each do |card|
      card_number = (round.deck.cards.index(card)) + 1
      puts "This is card #{card_number} out of #{total_cards}."
      puts "Question: #{card.question}"
      user_input = gets.chomp.upcase
      round.take_turn(user_input)
      puts round.turns.last.feedback



  end
end

start(round_1)
