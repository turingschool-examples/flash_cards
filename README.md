##  Flash Cards

This is the starter repository for the [Flash Cards](http://backend.turing.io/module1/projects/flashcards) project.
# double check that you are in your flashcards project directory!
pry(main)> require './lib/card'
#=> true

pry(main)> card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

pry(main)> card.question
#=> "What is the capital of Alaska?"

pry(main)> card.answer
#=> "Juneau"

pry(main)> card.category
#=> :Geography
_________________________________________

pry(main)> require './lib/turn'
#=> true

pry(main)> require './lib/card'
#=> true

pry(main)> card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

pry(main)> turn = Turn.new("Juneau", card)
#=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:geography>, @guess="Juneau">

pry(main)> turn.card
#=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

pry(main)> turn.guess
#=> "Juneau"

pry(main)> turn.correct?
#=> true

pry(main)> turn.feedback
#=> "Correct!"