require 'require_all'
require_all 'lib'

def start

  filename = './lib/cards.txt'
  total_cards = (CardGenerator.new(filename).cards).size
  cards = CardGenerator.new(filename).cards
  categories = (cards.map {|arr| arr.category}).uniq
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{total_cards} cards."
  puts '------------------------------------------------'

  while cards.count >= 1
    puts "This is card number #{((cards.length - total_cards) - 1).abs} out of #{total_cards}."
    puts "Question: #{cards[0].question}"
    guess = gets.chomp()
    round.take_turn(guess.downcase)
    num = (round.turns.count - 1)
    puts round.turns.fetch(num).feedback
  end

  puts "****** Game over! ******"

  guess_plural = "guesses"
  if round.number_correct == 1
    guess_plural = "guess"
  end

  puts "You had #{round.number_correct} correct #{guess_plural} out of #{total_cards} for a total score of #{round.percent_correct.to_i}%."

  categories.each do |cat|
    puts "#{cat} - #{round.percent_correct_by_category(cat).to_i}% correct"
  end

end

start
