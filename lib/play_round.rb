require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class PlayRound

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("What country does 45 take orders from?", "Russia", :Geography)
  card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_4 = Card.new("What is the largest planet in the solar system", "Jupiter", :STEM)
  cards = [card_1, card_2, card_3, card_4]

  @deck = Deck.new(cards)
  @round = Round.new(@deck)

    puts "\n\nWelcome! You're playing with #{@deck.cards.length} cards.\n"
    puts "-------------------------------------------------\n\n"

    until @round.flip >= @deck.cards.length
      puts "This is card number #{@round.flip + 1} out of #{@deck.cards.length}"
      puts "Question: " + @round.current_card.question
      guess = gets.chomp.to_s
      take_turn = @round.take_turn(guess)
      puts "\n" + take_turn.feedback + "\n\n"
    end

    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.length} for a total score of #{@round.percent_correct.round}%."
    puts "Geography - #{@round.percent_correct_by_category(:Geography).round}% correct"
    puts "STEM - #{@round.percent_correct_by_category(:STEM).round}% correct"
end
