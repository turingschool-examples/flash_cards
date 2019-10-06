class Deck

end

# pry(main)> require './lib/turn'
# #=> true
#
# pry(main)> require './lib/card'
# #=> true
#
# pry(main)> card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
# #=> #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>
#
# pry(main)> turn = Turn.new("Saturn", card)
# #=> #<Turn:0x00007f998413ee60 @card=#<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>, @guess="Saturn">
#
# pry(main)> turn.card
# => #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>
#
# pry(main)> turn.guess
# => "Saturn"
#
# pry(main)> turn.correct?
# => false
#
# pry(main)> turn.feedback
# => "Incorrect."
