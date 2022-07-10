require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"


def start
  card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "poodle", :PopCulture)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :PopCulture)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :TuringStaff)
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)
  puts("Welcome! You're playing with #{deck.cards.count} cards.")
  puts("-" * 40)
  turns = 0
  until turns == deck.count
    turns += 1
    puts("This is card number #{turns} out of #{deck.count}.")
    puts((("Question:#{round.current_card.question}")))
    guess = gets.chomp
    round.take_turn(guess)
    round.turns.last.correct?
    puts(round.turns.last.feedback)
  end

  puts(("Game Over!".center(40, "*")))
  puts(("you had #{round.number_correct} out of #{deck.count} for a total #{round.percent_correct.truncate}%"))
  puts("STEM - #{round.percent_correct_by_category(:STEM).truncate}% correct")
  puts("PopCulture - #{round.percent_correct_by_category(:PopCulture).truncate}% correct")
  puts("TuringStaff - #{round.percent_correct_by_category(:TuringStaff).truncate}% correct")
end

start
