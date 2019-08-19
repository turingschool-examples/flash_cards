require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

class Runner

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @card_4 = Card.new("What is the capital of North Dakota?", "Bismark", :Geography)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

puts "\n\nWelcome! You're playing with 4 cards."
puts "-------------------------------------\n\n"

puts "This is card number 1 out of 4.\n\n"
@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  puts "#{@card_1.question}"
    @guess = gets.chomp
      if @guess == @card_1.answer.downcase
        puts "Correct!"
      else
        puts "Incorrect!\n\n"
      end

puts "This is card number 2 out of 4.\n\n"
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  puts "#{@card_2.question}"
    @guess = gets.chomp
      if @guess == @card_2.answer.downcase
        puts "Correct!"
      else
        puts "Incorrect!\n\n"
      end

puts "This is card number 3 out of 4.\n\n"
  @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    puts "#{@card_3.question}"
      @guess = gets.chomp
        if @guess == @card_3.answer.downcase
          puts "Correct!"
        else
          puts "Incorrect!\n\n"
        end

puts "This is card number 3 out of 4.\n\n"
@card_4 = Card.new("What is the capital of North Dakota?", "Bismark", :Geography)
    puts "#{@card_4.question}"
      @guess = gets.chomp
        if @guess == @card_4.answer.downcase
          puts "Correct!"
        else
          puts "Incorrect!\n\n"
        end
      end

puts "************ Game Over! *************\n\n"
