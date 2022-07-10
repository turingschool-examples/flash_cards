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

  puts "Welcome! You're playing with #{@round.deck.cards.count} cards."
  puts "--------------------------------------------------------------"
  loop_cards
end


def loop_cards
  number_loops = @round.deck.cards.count
  number_loops.times do
    card_loop = @round.turns.count + 1
    puts "This is card number #{card_loop} out of #{@round.deck.count}."
    puts "Question: #{@round.current_card.question}"
    input = gets.chomp
    @round.take_turn(input)
    puts @round.turns.last.feedback
  end

  def end_of_game
    puts "****** Game over! ******"
    puts "You had #{@round.correct_turns.count} guesses out of #{@round.turns.count} score of #{@round.percent_correct}."
    puts "#{(@round.percent_correct_by_category(:STEM))}% correct"
    puts "#{(@round.percent_correct_by_category(:Geography))}% correct"
  end
end



start
end_of_game
