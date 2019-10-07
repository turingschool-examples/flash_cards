require_relative 'card'
require_relative 'deck'
require_relative 'turn'
require_relative 'round'

def start
  card_1 = Card.new("What is the capital of China?", "Beijing", :Geography)
  card_2 = Card.new("What element does Fe stand for?", "Iron", :STEM)
  card_3 = Card.new("Who was the first woman to receive a Nobel Prize?", "Marie Curie", :STEM)
  card_4 = Card.new("What style of art is characterized by its distinct use of dots to form images?", "Pointillism", :Art)
  card_5 = Card.new("Who painted the Mona Lisa?", "Leonardo da Vinci", :Art)

  cards = [card_1, card_2, card_3, card_4, card_5]
  deck = Deck.new(cards)
  round = Round.new(deck)
  deck_count = deck.count

  puts "~~~*** Welcome to the Flashcard Game ***~~~"
  puts "-" * 75
  puts "You are playing with #{deck.count} cards. Get ready!"

  while round.turns.count < deck_count

    puts "This is card number #{round.turns.count+1} out of #{deck_count}!"
    puts "Question: #{round.deck.cards[0].question}"
    puts "-" * 75
    puts "Enter your answer here:"
    round.take_turn(gets.chomp)
    puts "#{round.turns.last.feedback}"
  end

puts "~~~*** Game Over! ***~~~"
puts "You had #{round.number_correct} correct out of #{deck.count} for a total score of #{round.percent_correct}%!"
puts "Art - #{round.percent_correct_by_category(:Art)}% correct!"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct!"
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct!"
end

start
