# require './lib/deck'
# require './lib/turn'
require './lib/round'
require './lib/card_generator'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# card_4 = Card.new("What is 5 + 5?", "10", :STEM)
# card_5 = Card.new("What is Rachel's favorite animal?", "dog", :Turing_Staff)
# card_6 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
# card_7 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
# cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7]



# category_quantities = {}
#
# cards.each do |card|
#   if !category_quantities.has_key?(card.category)
#     category_quantities[card.category] = 1
#   else
#     category_quantities += 1
#   end
# end

cards = Card_Generator.new("cards.txt").cards

deck = Deck.new(cards)

round = Round.new(deck)

def start(deck, round)
  puts "Welcome! You're playing with #{deck.count} cards."
  puts "--------------------------------------------------------"
  card_count = 1

  while !deck.cards.empty?
    puts "This is card number #{card_count} out of #{deck.count}."
    puts "Question: #{deck.cards[0].question}"
    puts round.take_turn(gets.chomp)
    card_count += 1
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{card_count - 1} for a total score of #{round.percent_correct*100}%."
  round.list_percent_correct
  # round.number_correct_by_category.each {|key, value| puts "#{key} - #{value / round.total_turns_by_category[key]}% correct"}
end

start(deck, round)
