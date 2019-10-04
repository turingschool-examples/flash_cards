require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
  @card_1 = Card.new("What is 5 + 5?", 10, :Math)
  @card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  @card_4 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  @cards = [@card_1, @card_2, @card_3, @card_4]
  @turns = [@turn_1, @turn_2, @turn_3, @turn_4]
  @deck = Deck.new(@cards)
  @round = Round.new(@deck)

  puts "Welcome! You're playing with 4 cards."
  puts "-" * 60
  puts "this is card number 1 out of 4."
  puts "Question: #{@round.deck.cards[0].question}"
  @round.take_turn(gets.chomp.to_i, @round.deck.cards[0])
   "#{@round.turns.last.guess.to_i}"
   "#{@round.turns.last.feedback}"
  puts "this is card number 2 out of 4."
  puts "Question: #{@round.deck.cards[1].question}"
  @round.take_turn(gets.chomp, @round.deck.cards[1])
   "#{@round.turns.last.guess}"
   "#{@round.turns.last.feedback}"
  puts "Question: #{@round.deck.cards[2].question}"
  @round.take_turn(gets.chomp, @round.deck.cards[2])
   "#{@round.turns.last.guess}"
   "#{@round.turns.last.feedback}"
  puts "Question: #{@round.deck.cards[3].question}"
  @round.take_turn(gets.chomp, @round.deck.cards[3])
   "#{@round.turns.last.guess}"
   "#{@round.turns.last.feedback}"
  puts "* * * * * * Game over! * * * * * *"
  puts "You had #{@round.number_correct} out of #{@turns.length} for a total score of #{@round.percent_correct}."
  puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct"
  puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"
  puts "Math - #{@round.percent_correct_by_category(:Math)}% correct"
end

puts start
