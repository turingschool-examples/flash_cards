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

def start

  puts "Welcome to FLASHCARDS~! There are 3 cards."
  puts "Lets get started"
    until @round.count == 4 do
  puts "Question: #{@round.current_card.question}"
  @guess = gets.strip.capitalize
  @new_turn = @round.take_turn(@guess)
      puts @round.turns.last.feedback
    end

  puts "***** GAME OVER! *****"

  puts "You have #{@round.number_correct} correct guesses out of #{(@round.count.to_f - 1)} for a total score of #{@round.percent_correct}%"
      @deck.cards.each do |card|
        card.category
      puts "#{card.category} - #{@round.percent_correct_by_category(card.category)}% correct"
    end
end

start
