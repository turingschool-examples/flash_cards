require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


card_1 = Card.new("Organisms which are able to make their own food are called:", "producers", :Ecology)
card_2 = Card.new("A group of organisms of different species that live and interact together is referred to as a(n)", "community", :Ecology)
# card_3 = Card.new("The amount of energy that is passed on at each link in the food chain is about what percentage?", "10", :Ecology)
# card_4 = Card.new("In the nitrogen cycle, which form of nitrogen is used by plants?", "N2", :Ecology)
card_5 = Card.new("When cancer cells move to different parts of the body, it is called", "metastasis", :Health)
card_6 = Card.new("Many different organ systems working together", "Organism", :Health)
# card_7 = Card.new("The single cell that all multicellular organisms start off as is specifically called", " zygote", :Health)
# card_8 = Card.new("When leaving a movie theater, a person notices that the sidewalk is now wet. If the person assumes it rained during the movie, the person is making a(n)", " inference", :Lab)
card_9 = Card.new("When writing a conclusion, what should you always refer back to?", "hypothesis", :Lab)
card_10 = Card.new("What do you measure with an scale?", "mass", :Lab)
# binding.pry
deck = Deck.new([card_1, card_2, card_5, card_6, card_9, card_10])
round = Round.new(deck)

def start(round)
  counter = 0
  categories_played = []

  puts "Welcome! You're playing with #{round.deck.cards.size} cards."
  puts "_________________________________________________"

  until counter == round.deck.cards.size
    puts "This is card number #{round.turns.size + 1} out of #{round.deck.cards.size}"
    puts "Question: #{round.current_card.question}"
    counter += 1
    categories_played << round.current_card.category
    answer = gets.chomp
    turn = round.take_turn(answer)
    puts "#{turn.feedback}"
  end

  puts "****** Game over! ******"

  puts "You had #{round.number_correct} correct guesses out of #{counter} for a total score of #{(round.number_correct.to_f / counter * 100).to_i}%"
  unique_categories_played = categories_played.uniq
  print_unique_categories_played = unique_categories_played.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}%."
  end
end

start(round)
