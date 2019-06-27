require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class PlayGame
  def start

    card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    card_2 = Card.new("What is Rachel's favorite animal?", "panda", "Turing Staff")
    card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")

    deck = Deck.new([card_1, card_2, card_3, card_4])
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
    # puts "#{card_1.category} - #{percent_correct_by_category(card_1.category)} correct

    round.deck.cards.each do |card|
      puts "#{card.category} - #{round.percent_correct_by_category(card.category)}% correct"
    end
  end
end

game = PlayGame.new()
game.start
