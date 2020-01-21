require 'require_all'
require_all 'lib'

def play_game

  card_1 = Card.new("What is the largest mammal in North America?", "Bison", :Nature)
  card_2 = Card.new("What is the largest freshwater fish in North America?", "Sturgeon", :Nature)
  card_3 = Card.new("Which muscle group is antagonistic to the quadriceps?", "Hamstrings", :Anatomy)
  card_4 = Card.new("How many bones are in the human body?", "206", :Anatomy)

  total_cards = 4

  categories = [:Nature, :Anatomy]

  cards = [card_1, card_2, card_3, card_4]

  deck = Deck.new(cards)

  round = Round.new(deck)

  puts "Welcome! You're playing with #{total_cards} cards."
  puts '------------------------------------------------'

  while cards.count >= 1
    puts "This is card number #{((cards.length - 4) - 1).abs} out of #{total_cards}."
    puts "Question: #{cards[0].question}"
    guess = gets.chomp()
    round.take_turn(guess.downcase.gsub(/[^a-z0-9]/, '').capitalize)
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

play_game
