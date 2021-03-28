require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/printer'
require 'pry'

card_1 = Card.new("What is 5 + 5?", "10", :Arithmetic)
card_2 = Card.new("What is Joanna's favorite animal?", "cheetah", :Animal_Stuff)
card_3 = Card.new("What is the name of Megan's doggo?", "Nile", :Animal_Stuff)
card_4 = Card.new("Which important person in history was recently unveiled as the new face of the 50 pound note in the UK?", "Alan Turing", :History)
@deck = Deck.new([card_1, card_2, card_3, card_4])
@round = Round.new(@deck)
@printer = Printer.new
# @player_guess = user_input


def user_input
  puts "Your answer:"
  player_input = gets.chomp
  @round.turns << player_input
end

def start
  @printer.welcome_message
  @printer.card_message(@round.current_card, (@round.turns.count + 1))
  #keep writing out, then refactor (all 4 rounds) - then maybe attempt to condense into a loop,
  #on each loop, have count - use that to figure which card we're on
  # get user input
  @player_guess
  # @printer.feedback_message
  # @round.take_turn - pass it the input from rb:21 (string)
# binding.pry

end

start
binding.pry
user_input






# def beginning_user_input
#     player_input = gets.chomp
#     if player_input == "p" || player_input == "play"
#         while play_game.start_game == true
#           play_game.start_game
#         end
#     elsif player_input == "i" || player_input == "instructions"
#          @instance_of_printer.instructions_message
#          while play_game.start_game == true
#            play_game.start_game
#          end
#     else player_input == "q" || player_input == "quit"
#       @instance_of_printer.quit_message
#         exit
#     end
#   end
