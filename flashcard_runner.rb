require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new(
"In Kurt Vonnegut's Slaughterhouse-Five, what is the name of the planet Billy Pilgrim is kidnapped to?",
"Tralfamador",
:SciFiPlanets
)

card_2 = Card.new(
"In Cixin Liu's The Three Body Problem, what is the name of the planet in communication with Earth?",
"Trisolaris",
:SciFiPlanets
)

card_3 = Card.new(
"In Frank Herbert's Dune, what is the name of the desert planet that is home to the Fremen people?",
"Arrakis",
:SciFiPlanets
)

card_4 = Card.new(
"Who is the author of the 1979 novel Kindred?",
"Octavia Butler",
:SciFiAuthors
)

card_5 = Card.new(
"Who is the author of the Southern Reach Trilogy, originally published in 2014?",
"Jeff VanderMeer",
:SciFiAuthors
)

deck = Deck.new([card_1,card_2,card_3,card_4,card_5])

round = Round.new(deck)

def start(round)

  #intro
  puts "Welcome, you're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------
  "

  #rounds loop
  (round.deck.count).times do |card|
    puts "This is card number #{round.turn_count} out of #{round.deck.count}"
    puts "Question: #{round.current_card.question}"

    round.take_turn(gets.chomp)

    puts round.turns.last.feedback

  end

end

start(round)
