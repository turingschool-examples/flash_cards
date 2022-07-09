require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"


def start
  card_1 = Card.new("What is 5 + 5?", 10, :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "panda", :PopCulture)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :PopCulture)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :TuringStaff)
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)
  puts("Welcome! You're playing with #{deck.cards.count} cards.")
  puts("-" * 40)
  puts("This is card number 1 out of 4.")
  puts("Question: #{card_1.question}")
  num_c = 0
  answer = gets.chomp.to_i

  if card_1.answer == answer
    puts("Correct!")
    num_c += 1
  else
    puts("no")
  end

  puts("Question: #{card_2.question}")
  answer = gets.chomp.downcase
  p(answer)

  if card_2.answer == answer
    puts("Correct!")
    num_c += 1
  else
    puts("Incorrect.")
  end

  puts("Question: #{card_3.question}")
  answer = gets.chomp.downcase

  if card_3.answer == answer
    puts("Correct!")
    num_c += 1
  else
    puts("Incorrect.")
  end

  puts("Question: #{card_4.question}")
  answer = gets.chomp.split(/ |\_/).map(&:capitalize).join(" ")
  p(answer)

  if card_4.answer == answer
    puts("Correct!")
    num_c += 1
  else
    puts("Incorrect.")
  end

  puts("Game over!".center(40, "*"))
  puts("You had #{num_c} correct guesses out of #{deck.cards.count} for a total score of #{((num_c.to_f / deck.cards.count) * 100).truncate}%.")
end

start
