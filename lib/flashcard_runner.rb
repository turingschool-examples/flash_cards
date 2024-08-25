require_relative './card.rb'
require_relative './turn.rb'
require_relative './round.rb'
require_relative './deck.rb'


@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@cards = [@card_1, @card_2, @card_3]
@deck = Deck.new(@cards)
@round = Round.new(@deck)


def start 
    puts "Welcome! You're playing with #{@cards.length} cards."
    puts "----------------------------------------------------------"
    puts "This is card number #{@round.card_number} out of #{@cards.length}."
    puts "Question: #{@round.current_card.question}"
    user_input = gets.chomp
    puts user_input
end

# gets.chomp

start
# class Game
#     def initialize_game
#         @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#         @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#         @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#         @deck = Deck.new(@cards)
#         @turn = Turn.new("Juneau", @card_1)
#         @round = Round.new(@deck)
#     end

#     def welcome
#         
#         puts @round.welcome
#     end

#     def play_game
        
#     end
# end


# @cards = [@card_1, @card_2, @card_3]
# @turns = []
#         @user_guesses = []
#         @number_correct = 0
#         @card_number = 0

# puts "---------------------------------------------------------------"
# puts "This is card number #{@card.number} out of #{@cards.length} cards."

