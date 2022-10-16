require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

@cards = [@card_1, @card_2, @card_3]

@deck = Deck.new(@cards)
@round = Round.new(@deck)

def iterate_cards
  num_its = @round.deck.cards.count
  num_its.times do
    counter = @round.turns.count + 1
    puts "This is card number #{counter} out of #{@round.deck.count}."
    puts "Question: #{@round.current_card.question}"
    user_answer = gets.chomp
    @round.take_turn(user_answer)
    puts @round.turns.last.feedback
    end
end

def run_cli
  puts "Welcome! You're playing with #{@round.deck.cards.count} cards."
  puts "-------------------------------------------------"
  @round.categories_used
  iterate_cards
end

def game_over
  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.size} for a total score of #{@round.percent_correct}%."
  @round.cats.each do |cat|
    puts "#{cat} - #{@round.percent_correct_by_category(cat)}% correct"
  end
end

run_cli
game_over
