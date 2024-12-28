# to run the program, type ruby flashcard_runner.rb in the terminal

require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/round'
require_relative 'lib/turn'
require './lib/card_generator'

class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
end

class Round
  def initialize(deck)
    @deck = deck
    @current_card_index = 0
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.size} cards."
    puts "-------------------------------------------------"
    @deck.cards.each_with_index do |card, index|
      puts "This is card number #{index + 1} out of #{@deck.cards.size}."
      puts "Question: #{card.question}"
      print "Your answer: "
      user_answer = gets.chomp
      if user_answer.downcase == card.answer.downcase
        puts "Correct!"
      else
        puts "Incorrect. The correct answer was #{card.answer}."
      end
    end
    puts "Game over! Thanks for playing."
  end
end

cards = CardGenerator.new('./cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)
round.start