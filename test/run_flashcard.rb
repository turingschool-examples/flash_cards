require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_reader'
require 'pry'

@card_reader = CardReader.new

@deck = Deck.new(@card_reader.read_cards("./lib/cards.txt"))

@round = Round.new(@deck)

def start_game
  puts "----------------------------------------------------"
  puts "Welcome! You're playing with #{@deck.count} card(s)!"

  # Continue to ask questions while there are cards present in the deck
  while @deck.count > 0
    puts "----------------------------------------------------"
    puts "This is card #{@round.turns.count + 1} of #{@deck.count + @round.turns.count}!"
    puts "Question: #{@round.current_card.question}"
    print "> "
    user_answer = gets.chomp.capitalize
    @round.take_turn(user_answer)
    puts @round.turns.last.feedback
  end

  puts "    *** Game Over ***"
  puts "You had #{@round.number_correct} correct guesses on #{@round.turns.count} cards for a total score of #{@round.percent_correct}."

  # Take array of card categories and place all unique elements into a new array so they only show up once
  @categories = @round.identify_all_categories.uniq
  # Display percentage correct in each category
  while @categories.count > 0
    puts "#{@categories[0]}: #{@round.percent_correct_by_category(@categories[0])}"
    @categories.shift
  end
end

start_game()
