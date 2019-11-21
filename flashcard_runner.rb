#Runs the Flashcard Game
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# card_4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
# card_5 = Card.new("What is the website called to store gits?", "GitHub", :Software)
#
# deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

generator = CardGenerator.new
deck = Deck.new(generator.generate_cards)

round = Round.new(deck)


def start(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "----------------------------"
  until round.current_card == nil
    puts "This is card number #{round.current_card_number + 1} out of #{round.deck.count} cards."
    puts round.deck.cards[round.current_card_number].question
    user_guess = gets.chomp
    round.take_turn(user_guess)
    puts round.turns.last.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct answers out of #{round.deck.count} for a total score of #{round.percent_correct.to_i}%"
  round.number_asked_per_category.each_key do |key|
    puts "#{key.to_s} - #{round.percent_correct_by_category(key).to_i}% correct"
  end

end

start(round)
