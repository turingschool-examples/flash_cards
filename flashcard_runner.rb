require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
# require 'pry'

class PlayGame
  def start
    cards_arr = CardGenerator.new("./lib/cards.txt")
    deck = Deck.new(cards_arr.generate)
    deck_size = deck.cards.length
    round = Round.new(deck)

    puts "Welcome! You're playing with #{deck_size} cards."
    puts "-------------------------------------------------"

    deck_size.times do |i|
      puts "This is card number #{i + 1} out of #{deck_size}."
      puts "Question: " + deck.cards[i].question
      new_turn = round.take_turn($stdin.gets.chomp())
      puts new_turn.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{deck_size} for a total score of #{round.percent_correct}%."
    results = deck.cards.map do |card|
       "#{card.category} - #{round.percent_correct_by_category(card.category)}% correct"
     end.uniq.each { |result| puts result }

  end
end

game = PlayGame.new()
game.start
