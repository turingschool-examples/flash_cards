require_relative './card.rb'
require_relative './turn.rb'
require_relative './round.rb'
require_relative './deck.rb'


@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# @card = Card.new(@question, @answer, @category)
@cards = [@card_1, @card_2, @card_3]
@deck = Deck.new(@cards)
@turn = Turn.new(@guess, @card)
@round = Round.new(@deck)

# require 'pry'; binding.pry
def start
        @round.deck
        @round.turns
        puts "Welcome! You're playing with #{@cards.length} cards."
        puts "----------------------------------------------------------"
    @round.deck.cards.length.times do
        puts "This is card number #{@round.turn_number} out of #{@cards.length}."
        puts "Question: #{@round.current_card.question}"
        user_input = gets.chomp
        new_turn = @round.take_turn(user_input) 
        # require 'pry'; binding.pry
        puts new_turn.feedback
    end
    puts "****** Game over! ******"
    require 'pry'; binding.pry
    puts "You had #{@round.number_correct} correct guesses out of #{@cards.length} for a total score of #{@round.percent_correct}."
    puts
end

start