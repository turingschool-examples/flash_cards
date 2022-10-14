require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

# create some cards
card_1 = Card.new( "What color is water?", "Blue", :Basics)
card_2 = Card.new( "What color is fire?", "Red", :Basics)
card_3 = Card.new( "In what state is Detroit", "Michigan", :Geography)
card_4 = Card.new( "What is the Michigan state stone?", "Petoskey", :Geology)
card_5 = Card.new( "What is the laziest type of rock?", "Sedimentary", :Geology)
card_5 = Card.new( "What is the best IDE?", "Vim", :STEM)
card_6 = Card.new( "Initials of the creator of Rails", "DHH", :STEM)
card_7 = Card.new( "Author of POODR and Ruby Legend", "Sandi Metz", :STEM)
card_8 = Card.new( "What is the abbreviation for Model, View, Controller?", "MVC", :STEM)
card_9 = Card.new( "Name of the opensource app store for terminal?", "Homebrew", :STEM)

# create an array of cards
card_array = [card_1,
              card_2,
              card_3,
              card_4,
              card_5,
              card_6,
              card_7, 
              card_8,
              card_9] 

# put those cards into a deck
deck = Deck.new(card_array)

# create a new round using the deck you created



# start the round using a new method called start











puts '
███████ ██       █████  ███████ ██   ██  ██████  █████  ██████  ██████  ███████ 
██      ██      ██   ██ ██      ██   ██ ██      ██   ██ ██   ██ ██   ██ ██      
█████   ██      ███████ ███████ ███████ ██      ███████ ██████  ██   ██ ███████ 
██      ██      ██   ██      ██ ██   ██ ██      ██   ██ ██   ██ ██   ██      ██ 
██      ███████ ██   ██ ███████ ██   ██  ██████ ██   ██ ██   ██ ██████  ███████ 
'




