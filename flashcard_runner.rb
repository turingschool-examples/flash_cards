require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


  @round = Round.new(
  @deck = Deck.new([
  # @cards = CardGenerator.newCardGenerator.new('.data/cards.txt').cards
  @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
  @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
  @card_3 = Card.new("What planet is furthest from the sun?", "Uranus", :STEM),
  @card_4 = Card.new("What is the name of the country that encompasses more than 250 islands?", "Indonesia", :Geography)
  ]))


def start
  puts "-" *50
  puts "Welcome! You're playing with #{@round.deck.count} cards."
  until @round.turns.count == 4
    puts "-" *50
    #need to try a different method for cunt here
    puts "This is card number #{@round.turns.count + 1} out of 4."
    puts "Question: #{@round.current_card.question}"
    puts "-" *50
    puts "Type your answer below:"
    puts "-" *50
    answer = gets.chomp.capitalize
    @round.take_turn(answer)
    puts "#{@round.turns.last.feedback}"
  end

  def results
    puts "****** Game Over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}%."
    puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"
    puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct"
  end
end

start
results
