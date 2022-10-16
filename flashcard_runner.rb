
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class Game

  attr_reader :card_1, :card_2, :card_3, :cards, :deck, :round, :turn, :guess

  def initialize
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

 def start
   puts "Welcome! You are playing with #{deck.count} cards."
   puts "--------------------------------------------------------------"

   while (round.turns.length < 3)
     puts "This is card number #{round.turns.length + 1} out of #{deck.count}"

     puts "#{round.current_card.question}"

     round.take_turn(@guess = gets.chomp)

     puts round.turns.last.feedback
   end

 end

 def game_over
   puts "****** Game Over! *******"
   puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%."
   puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct."
   puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct."
 end

end

new_game = Game.new
new_game.start
new_game.game_over
