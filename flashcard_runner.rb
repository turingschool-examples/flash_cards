require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
  card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "velociraptor", "Turing Staff")
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
  card_4 = Card.new("What cardboard cutout lives at Turing", "Justin Bieber", "Pop Culture")
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)

  round_1 = Round.new(deck)

  puts "Welcome! You're playing with #{round_1.deck.count} cards."
  deck.cards.each do |card|
    puts "This is card number #{(round_1.turns.count) + 1} out of #{round_1.deck.count}."
    puts round_1.current_card.question
    round_1.take_turn(gets.chomp)
    puts round_1.turns.last.feedback
  end

  puts "******* Game Over! *******"
  puts "You had #{round_1.number_correct} out of #{round_1.deck.count} for a total score of #{round_1.percent_correct.to_i}%."
  puts "STEM - #{round_1.percent_correct_by_category(:STEM).to_i}%."
  puts "Turing Staff - #{round_1.percent_correct_by_category("Turing Staff").to_i}%."
  puts "Pop Culture - #{round_1.percent_correct_by_category("Pop Culture").to_i}%."
end
start
