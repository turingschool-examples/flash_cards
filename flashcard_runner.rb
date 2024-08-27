require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def get_round
  # Create some Cards
  card_1 = Card.new('What is 5 + 5?', '10', :math)
  card_2 = Card.new("What is Rachel's favorite animal?", 'Turkey', :Turing)
  card_3 = Card.new("What is Mike's middle name?", 'nobody knows', :Turing)
  card_4 = Card.new('What cardboard cutout lives at Turing?', 'Justin Bieber', :Turing)

  # Put those card into a Deck
  deck = Deck.new([card_1, card_2, card_3, card_4])

  # Create a new Round using the Deck you created
  Round.new(deck)
end

# Start the round using a new method called start
def start
  round = get_round
  puts "Welcome! You're playing with 4 cards."
  puts '-------------------------------------------------'
  puts "This is card number #{round.turns.length} out of #{round.deck.cards.length}"

  # first question
  puts "Question: #{round.deck.cards.first.question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
  puts new_turn.correct?
end

start
