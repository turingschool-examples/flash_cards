require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

@cards = [@card_1, @card_2, @card_3]

@deck = Deck.new(@cards)
@round = Round.new(@deck)
@card_total = @cards.count

puts "Welcome! You are playing with #{@card_total} cards."
puts "-" * 50

def start
  until @round.turns.count == @card_total

   puts "This is card number #{@round.turns.count + 1} out of #{@card_total}."
   puts "Question: #{@round.current_card.question}"

   @round.take_turn(gets.chomp.capitalize)

   puts "-" * 50
   puts "#{@round.turns.last.feedback}"
  end

def game_over
  puts "****** Game Over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@card_total} for a total score of #{@round.percent_correct}%."
  puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct."
  puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct."
end
end

start
game_over
