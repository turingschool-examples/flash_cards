require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/printer'
require 'pry'

card_1 = Card.new("What is 5 + 5?", "10", :Arithmetic)
card_2 = Card.new("What is Joanna's favorite animal?", "cheetah" || "Cheetah", :Animal_Stuff)
card_3 = Card.new("What is the name of Megan's doggo?", "Nile" || "nile", :Animal_Stuff)
card_4 = Card.new("Which important person in history was recently unveiled as the new face of the 50 pound note in the UK?", "Alan Turing" || "alan turing", :History)
@deck = Deck.new([card_1, card_2, card_3, card_4])
@round = Round.new(@deck)
@printer = Printer.new

#REFACTOR - move def of start method to aeparate class

def start #REFACTOR TO LOOP IF TIME
  @printer.welcome_message
  #card_1
  @printer.card_message(@round.current_card, (@round.turns.count + 1))
  initiate_game_flow
  @printer.feedback_message(@round.turns[0].guess, @round.turns[0].card.answer)
  #card_2
  @printer.card_message(@round.current_card, (@round.turns.count + 1))
  initiate_game_flow
  @printer.feedback_message(@round.turns[1].guess, @round.turns[1].card.answer)
  #card_3
  @printer.card_message(@round.current_card, (@round.turns.count + 1))
  initiate_game_flow
  @printer.feedback_message(@round.turns[2].guess, @round.turns[2].card.answer)
  #card_4
  @printer.card_message(@round.current_card, (@round.turns.count + 1))
  initiate_game_flow
  @printer.feedback_message(@round.turns[3].guess, @round.turns[3].card.answer)

  @printer.final_score_message(@round.number_correct, @round.percent_correct)


  @deck.cards.each do |card|
    percents = @round.percent_correct_by_category(card.category)
    @printer.final_score_by_category_message(card.category, percents)
  end

end

#loop through deck, each_with_index |card, index|
# @printer.card_message(@round.current_card, (@round.turns.count + 1))
# initiate_game_flow
#  @printer.feedback_message(@round.turns[index].guess, @round.turns[index].card.answer)



def initiate_game_flow
  puts "Your answer:"
  player_input = gets.chomp
  @round.take_turn(player_input)
end


# def end_of_deck
#   @turns.count == (deck.cards.count)
# end

start
