require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'


def start

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards."

  deck.count.times do

  puts "This card is number #{round.turns.length + 1} out of #{deck.count}.
    Question: #{round.current_card.question}"

      turn_1 = round.take_turn(gets.chomp)
      puts "#{turn_1.feedback}"

    if round.turns.length == deck.count

      puts "****** Game Over! ******"

      puts "you had #{round.number_correct} out of #{deck.count} for a total score of #{round.percent_correct}%."

      puts "STEM - #{round.percent_correct_category(:STEM)}% correct"

      puts "Geography - #{round.percent_correct_category(:Geography)}% correct"

      puts "Pop Culture - #{round.percent_correct_category(:Pop_Culture)}% correct"

    end

  end
  #binding.pry
end


start
