require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


def start
  card_1 = Card.new("How many heroes are in Overwatch?", "30", :Gaming)
  card_2 = Card.new("Where is the capital of Florida?", "Tallahassee", :Geography)
  card_3 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_4 = Card.new("What does metal smell like?", "nothing", :Science)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)
  card_count = 0
  total_cards = round.deck.count

  puts "Welcome! You're playing with #{deck.cards.count} cards."
  puts "-------------------------------------------------"

  while card_count < total_cards
    print "This is card number #{card_count + 1} out of #{total_cards}.\n"
    print "Question: #{round.current_card.question}\n"
    guess = $stdin.gets.chomp
    feedback = round.take_turn(guess).feedback
    print feedback
    print "\n"
    card_count += 1
  end
  print "****** Game over! ******\n"
  print "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%\n"
  print "Gaming - #{round.percent_correct_by_category(:Gaming)}%\n"
  print "Geography - #{round.percent_correct_by_category(:Geography)}%\n"
  print "Science - #{round.percent_correct_by_category(:Science)}%\n"
end
start
