require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new("./lib/cards.txt")

cards.get_text_content

cards.card_creator

deck = Deck.new(cards.card_array)

round = Round.new(deck)

def start(round)

  category_array = []

  round.deck.cards.each do |card|
    category_array << card.category
  end

  category_array.uniq! #gives array of all unique categories

  #intro
  puts "Welcome, you're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------
  "
  #turn loop
  (round.deck.count).times do |card|
    puts "This is card number #{(round.turn_count)+1} out of #{round.deck.count}"
    puts "Question: #{round.current_card.question}"

    round.take_turn(gets.chomp)

    puts round.turns.last.feedback
    puts
  end

  #ending
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.round(2)}%."

  puts

  #category results loop
  category_array.each_with_index do |category,index|
    puts "#{category_array[index].capitalize} - #{round.percent_correct_by_category(category_array[index]).round(2)}% correct"
  end

end

start(round)
