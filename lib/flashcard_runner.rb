# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
# require 'pry'

# class FlashcardRunner
#   attr_reader :round,
#               :deck,
#               :turns

#   def initialize
#     @deck = deck
#     @round = round
#   end

    #@card  = [@question, @answer, @category]
    @card_1 = Card.new("What is Princess Leia's home planet?", "Alderaan", :Geography)
    @card_2 = Card.new("What planet are Ewoks from?", "Endor", :Geography)
    @card_3 = Card.new("Who was the first American woman in space?", "Sally Ride", :STEM)
    @card_4 = Card.new("What is the fastest land mammal?", "Cheetah", :STEM)
    @card_5 = Card.new("Who was the first man on the moon?", "Neil Armstrong", :STEM)
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
    @card_total = @cards.count
    @deck  = Deck.new(@cards)
    @round = Round.new(@deck)

  puts "Welcome! You are playing with #{@round.deck.count} cards."

  def start
    while @round.turns.count + 1 <= @card_total
      puts "~" * 50
      puts "This is card number #{@round.turns.count + 1} of 5."
      puts "Question: #{@round.current_card.question}"
      player_guess = @round.take_turn(gets.chomp.capitalize)
        # if @round.take_turn.correct?
        #   puts "#{round.turns.last.feedback}"
        # #puts "Correct"
        # else
        #   puts "The correct answer is #{deck.card.answer.first}"
        end
    end
#   end
# end

start


# game1 = FlashcardRunner.new
# game1.start
# end
