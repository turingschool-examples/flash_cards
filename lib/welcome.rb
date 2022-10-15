require './lib/game_setup'
require './lib/start_round'
def welcome
  system 'clear'
  puts "Welcome! You're playing with #{@round.deck.count} cards."
  puts "Start?"
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
end
