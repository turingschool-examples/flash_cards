require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def get_round
  # Create some Cards
  card_1 = Card.new('What is 5 + 5?', '10', :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", 'Turkey', 'Turing Staff')
  card_3 = Card.new("What is Mike's middle name?", 'nobody knows', 'Turing Staff')
  card_4 = Card.new('What cardboard cutout lives at Turing?', 'Justin Bieber', 'Pop Culture')

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
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.cards.length}"

  # first question
  puts "Question: #{round.deck.cards.first.question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
  puts new_turn.correct?

  # 2nd question
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.cards.length}"
  puts "Question: #{round.deck.cards[1].question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
  puts new_turn.correct?

  # 3rd question
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.cards.length}"
  puts "Question: #{round.deck.cards[2].question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
  puts new_turn.correct?

  # 4th question
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.cards.length}"
  puts "Question: #{round.deck.cards[3].question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
  puts new_turn.correct?

  # Game stats
  puts '****** Game over! ******'
  puts "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct}%."
  puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct."
  puts "Turing Staff - #{round.percent_correct_by_category('Turing Staff')}% correct."
  puts "Pop Culture - #{round.percent_correct_by_category('Pop Culture')}% correct."
end

start
