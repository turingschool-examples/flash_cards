require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def get_round_from_file
  file_path = './input/flash_cards.csv'
  fcards = File.readlines(file_path)

  card_1 = Card.new(fcards[0][0], fcards[0][1], fcards[0][2])
  card_2 = Card.new(fcards[1][0], fcards[0][1], fcards[0][2])
  card_3 = Card.new(fcards[2][0], fcards[0][1], fcards[0][2])
  card_4 = Card.new(fcards[3][0], fcards[0][1], fcards[0][2])

  file_deck = [card_1, card_2, card_3, card_4]

  Round.new(file_deck)

  # still debugging, doesn't work...
  # puts file_round.deck[0].question
end

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
  system('clear') # Clear the terminal

  round = get_round
  print rgb('b') # blue text output
  puts "Welcome! You're playing with 4 cards."
  puts '-------------------------------------'

  cards = round.deck.cards.count
  card_num = 1

  round.deck.cards.each do |card|
    print rgb('b')
    puts

    puts "This is card number #{card_num} out of #{cards}"

    # Question
    print "Question: #{card.question}: "
    print rgb('x')

    # Answer
    guess = gets.chomp
    new_turn = round.take_turn(guess)

    # Print result of this turn
    print rgb('b')
    puts new_turn.correct? ? rgb('g') + 'Correct!' : rgb('r') + 'Incorrect.'
    print rgb('x')

    card_num += 1 # Next card
  end

  # Game stats
  puts
  print rgb('b')
  puts "****** Game over! ******\n\n"
  print "You had #{round.number_correct} correct guesses out of #{cards} "
  print "for a total score of #{round.percent_correct.to_i}%.\n"

  categories = []

  round.deck.cards.each do |card|
    categories << card.category
  end

  categories.uniq.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct."
  end
  print rgb('x') # stop colorizing
end

# terminal color codes for red, green, blue, and end color
def rgb(input)
  if input == 'r'
    "\e[31m"
  elsif input == 'g'
    "\e[32m"
  elsif input == 'x' # stop code
    "\e[0m"
  elsif input == 'b'
    "\e[34m"
  end
end

start
