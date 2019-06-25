require './lib/turn'
require './lib/card'

card = Card.new("What's the airspeed velocity of an unladen swallow?",
                "I don't know",
                :Biology)

turn = Turn.new("25", card)

turn.card

turn.guess

turn.correct?

turn.feedback
