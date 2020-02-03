require_relative './lib/round.rb'
require_relative './lib/deck.rb'
require_relative './lib/card.rb'
require_relative './lib/turn.rb'

@card_1 = Card.new("In what year did the United States of America declare independence from Great Britain?", "1776", :History)
@card_2 = Card.new("What is the capital of Canada?", "Ottawa", :Geography)
@card_3 = Card.new("What is largest country in the world?", "Russia", :History)
@cards = [@card_1, @card_2, @card_3]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

  def start
    puts "Welcome! You're playing with #{@cards.count} cards."
    puts  " -------------------------------------------------"
    puts   "This is card number #{@cards.find_index(@round.current_card) + 1}."
    puts  @round.current_card.question

    @round.take_turn(gets.chomp)

    puts   "This is card number #{@cards.find_index(@round.current_card) + 2}."
    puts  @round.current_card.question

    @round.take_turn(gets.chomp)

    puts   "This is card number #{@cards.find_index(@round.current_card) + 3}."
    puts  @round.current_card.question

    @round.take_turn(gets.chomp)

    puts "You got #{@round.percent_correct.to_i}% of the questions correct"
  end

start
