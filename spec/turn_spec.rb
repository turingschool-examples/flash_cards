require './lib/turn'
#=> true

require './lib/card'
#=> true

card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
#=> #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>

turn = Turn.new("Saturn", card)
#=> #<Turn:0x00007f998413ee60 @card=#<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>, @guess="Saturn">

turn.card
#=> #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>

turn.guess
#=> "Saturn"

turn.correct?
#=> false

turn.feedback
#=> "Incorrect."