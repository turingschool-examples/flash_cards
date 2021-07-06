require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card1, card2, card3]
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  deck_count = round.deck.count
  card_counter = 0

  list_of_categories = []

  round.deck.cards.each do |card|
    if !list_of_categories.include?(card.category)
      list_of_categories << card.category
    end
  end

  puts "Welcome! You're playing with #{deck_count} cards."
  puts "-" * 40

  while round.deck.cards.size > 0
    card_counter += 1
    puts "This is card number #{card_counter} out of #{deck_count}."

    puts "Question: #{round.current_card.question}"
    input = gets.chomp
    current_turn = round.take_turn(input)
    puts current_turn.feedback
    puts "-" * 40
  end

  puts "*********** Game over! ***********"
  puts "You had #{round.number_correct.to_i} correct guesses out of #{deck_count} for a total score of #{'%.2f' % round.percent_correct}%."
  list_of_categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
  end
end

start(round)
