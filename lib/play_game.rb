require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class PlayGame
  attr_writer :guess

  attr_reader :deck

  def initialize(guess, deck)
    @guess = guess
    @deck = deck
    @category = []
  end

  def start
    p "Welcome! You're playing with 4 cards."
    p "-------------------------------------------------"

    round = Round.new(@deck)
    game = Turn.new(@guess, @deck)
    counter = 1

    @deck.cards.each do |card|
      @category << card.category
    end

    until deck.cards.empty? == true
      p "This is card number #{counter} out of 4."
      p "Question #{counter} is: #{round.current_card.question}"
      @guess = gets.chomp.downcase
      answer = round.take_turn(@guess)
      p answer.feedback
      counter += 1
    end

    p "****** Game over! ******"
    p "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct.to_i}%."

    @category.uniq.each do |category|
      p "#{category}- #{round.percent_correct_by_category(category).to_i}% correct"
    end

  end
end
