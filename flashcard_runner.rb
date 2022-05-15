require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class FlashcardRunner
  attr_reader :deck, :round, :cards
  def initialize
    card_1 = Card.new("Who is the best basketball player ever?", "Michael Jordan", :Sports)
    card_2 = Card.new("What team did Michael Jordan play for?", "Chicago Bulls", :Sports)
    card_3 = Card.new("What year did World War II end?", "1945", :History)
    card_4 = Card.new("How many degrees are in a triangle?", "180", :Math)
    @cards = [card_1, card_2, card_3, card_4]
    @deck = Deck.new(cards)
    @round = Round.new(deck)

    puts "Welcome! You're playing with #{deck.cards.count} cards."
    puts "-"* 50
  end

  def start
    card_number = 1
    while card_number <= deck.count
      puts "This is card number #{card_number} out of #{deck.cards.count}."
      puts "Question: #{round.current_card.question}"
      guess = gets.chomp
      next_turn = round.take_turn(guess)
      puts next_turn.feedback
      card_number += 1
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct} guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%. "
    categories = []
    deck.cards.each do |card|
      categories << card.category
    end
    categories.uniq.each do |category|
      puts "#{category} - #{(round.percent_correct_by_category(category)).to_i}% correct"
    end
  end
end

new_game = FlashcardRunner.new
new_game.start
