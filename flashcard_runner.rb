require './lib/game_setup'
require './lib/round_start'



system 'clear'
puts "Welcome! You're playing with #{@round.deck.count} cards."
puts '------------------------------------------------------------'
input = gets.chomp
until input == 'start'
  system 'clear'
  puts "Welcome! You're playing with #{@round.deck.count} cards."
  puts '------------------------------------------------------------'
  puts 'Type "start"'
  input = gets.chomp
end
start(input)
