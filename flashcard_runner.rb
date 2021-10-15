require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@card_4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
@card_5 = Card.new("What is the capital of Japan?", "Tokyo", :Geography)
@card_6 = Card.new("What is the capital of Indonesia?", "Jakarta", :Geography)
@card_7 = Card.new("What programming language do we learn in Mod 1 at Turing?", "Ruby", :STEM)


@cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7]

@deck_1 = Deck.new(@cards)
@round_1 = Round.new(@deck_1)

def start
  puts "Welcome! You're playing with #{@cards.length} cards."
  puts "----------------------------------------------------"

  until @round_1.turns.length == @round_1.deck.cards.length
    puts "This card is #{@round_1.turns.length + 1} out of #{@deck_1.cards.length}."
    puts "Question: #{@round_1.current_card.question}"
    user_reply = gets.chomp
    @round_1.take_turn(user_reply)
    puts "#{@round_1.turns[0].feedback}"
  end

  if @round_1.turns.length == @round_1.deck.cards.length
    puts "****** Game Over ******"
    puts "----------------------------------------------------"
    puts "You had #{@round_1.number_correct} correct guesses out of #{@cards.length} for a total score of #{@round_1.percent_correct.round(1)}%"
  end
end

start
