require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/printer'
require 'pry'

card_1 = Card.new("What is 5 + 5?", "10", :Arithmetic)
card_2 = Card.new("What is Joanna's favorite animal?", ("cheetah"), :Animal_Stuff)
card_3 = Card.new("What is the name of Megan's doggo?", "nile", :Animal_Stuff)
card_4 = Card.new("Which important person in history was recently unveiled as the new face of the 50 pound note in the UK?", "alan turing", :History)
@deck = Deck.new([card_1, card_2, card_3, card_4])
@round = Round.new(@deck)
@printer = Printer.new

def start
  @printer.welcome_message

  @deck.cards.each_with_index do |card, index|
    @printer.card_message(@round.current_card, (@round.turns.count + 1))
    initiate_game_flow
    @printer.feedback_message(@round.turns[index].guess.downcase, @round.turns[index].card.answer)
  end

  @printer.final_score_message(@round.number_correct, @round.percent_correct)
  @deck.cards.each do |card|
    percents = @round.percent_correct_by_category(card.category)
    @printer.final_score_by_category_message(card.category, percents)
  end
end

def initiate_game_flow
  puts "Your answer:"
  player_input = gets.chomp
  @round.take_turn(player_input)
end

start
