require_relative './lib/card'
require_relative './lib/turn'
require_relative './lib/deck'
require_relative './lib/round'
require 'pry'

def start
card_1 = Card.new("What is your favorite color?' 'Blue!... No, wait, Red!", "Monty Python", :Movie)
card_2 = Card.new("Do or do not, there is no try", "Star Wars", :Movie)
card_3 = Card.new("Shot me in the goddamn liver, Morty!", "Rick and Morty", :TV)
card_4 = Card.new("Reach for the sky!... There's a snake in my boot!", "Toy Story", :Movie)
card_5 = Card.new("Winter is coming.", "Game of Thrones", :TV)
card_6 = Card.new("You know nothing, Jon Snow.", "Game of Thrones", :TV)

cards = [card_1, card_2, card_3]
cards_2 = [card_4, card_5, card_6]

deck = Deck.new(cards)
deck_2 = Deck.new(cards_2)

round = Round.new(deck)
round_2 = Round.new(deck_2)

puts "Welcome to the 'Eh' Movie and TV quiz! You will be playing with #{deck.count} cards."
puts "Each card presents a movie or TV quote - Guess where the quote is from!"
puts "---" * 10
total_cards = deck.count
  while deck.count != 0
    puts "You are on card number #{round.turns.count + 1} out of #{total_cards}."
    puts "Quote: #{round.current_card.question}"
    puts "Name where this quote is from:"
    guess = gets.chomp
    turn = round.take_turn(guess)
    puts turn.feedback
      if turn.correct? == false
        puts "The correct answer is #{turn.card.answer}"
      end
      puts "---" * 10
  end
  puts "****** Game Over! ******"
  puts "You had #{round.number_correct} out of #{round.turns.count} for a total score of #{round.percent_correct}%"
  puts "TV - #{round.percent_correct_by_category(:TV)}% correct"
  puts "Movie - #{round.percent_correct_by_category(:Movie)}% correct"
end


start

# binding.pry
