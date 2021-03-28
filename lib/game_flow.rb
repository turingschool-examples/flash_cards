# require './lib/card'
# require './lib/turn'
# require './lib/deck'
# require './lib/round'
# require './lib/printer'
# require 'pry'
#
# class GameFlow
# #keep writing out, then refactor (all 4 rounds) - then maybe attempt to condense into a loop,
# #on each loop, have count - use that to figure which card we're on
# # get user input
#
# def user_input
#   puts "Your answer:"
#   @player_input = gets.chomp
#   @round.take_turn(player_input)
# end
#
# def start
#   @printer.welcome_message
#   @printer.card_message(@round.current_card, (@round.turns.count + 1))
#
#   user_input
#
#   # binding.pry
#
#   # @printer.feedback_message(@player_input, @round.current_card.answer)
#   # @round.take_turn - pass it the input from rb:21 (string)
#
# end
#
# end
