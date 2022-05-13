require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

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
