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
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end
#
#   def what_is_card_question?
#     @deck.each.question do |cards|
#     end
#   end
# end



puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------"

puts "This is card number 1 out of 4."
@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  puts "#{@card_1.question}"
    @guess = gets.chomp
      if @guess == @card_1.answer.capitalize
        puts "Correct!"
      else
        puts "Incorrect!"
      end

      puts "This is card number 2 out of 4."
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        puts "#{@card_2.question}"
          @guess = gets.chomp
            if @guess == @card_2.answer.capitalize
              puts "Correct!"
            else
              puts "Incorrect!"
            end
          end
        
