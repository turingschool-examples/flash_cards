require './lib/card'
require './lib/turns'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card4 = Card.new("What killed Steve Irwin?", "Stingray", :STEM)
card5 = Card.new("Who is Taylor Swift's NFL boyfriend?", "Travis Kelce", "Pop Culture")
card6 = Card.new("What band was Beyonce part of before she went solo?", "Destiny's Child", "Pop Culture")
card7 = Card.new("By what other name is Myanmar known by?", "Burma", :Geography)
cards = [card1, card2, card3, card4, card5, card6, card7]

deck = Deck.new(cards)

round = Round.new(deck)

def start(round)
  card_count = 0
  round = round
  puts "Welcome! You're playing with #{round.deck.cards.count} cards."
  puts "-------------------------------------------------"
  while round.turns.count < round.initial_card_count
    round.current_card
    card_count += 1
    puts "This is card number #{card_count} out of #{round.initial_card_count}"
    puts "Question: #{round.current_card.question}"
    answer = gets.chomp
    round.take_turn(answer)
    puts round.turns.last.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.initial_card_count} for a total score of #{round.percent_correct}."
  puts "STEM - #{round.percent_correct_by_category(:STEM)} correct"
  puts "Geography - #{round.percent_correct_by_category(:Geography)} correct"
  puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")} correct"
end

start(round)