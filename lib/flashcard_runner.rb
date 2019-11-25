require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# card_1 = Card.new("Who is the man that would risk his neck for his brother man?", "Shaft! Can you dig it?", :Movies)
# card_2 = Card.new("What does it mean when P-Square asks you to chop their money?", "They no fear, cause e no dey empty.", :Music)
# card_3 = Card.new("Finish this phrase: Kirikou n'est pas grand, ...", "Mais il est vaillant.", :Movies)
# card_4 = Card.new("What dance did Rihanna confuse American audiences with during her 2018 Grammy performance of Wild Thoughts?", "Gwara Gwara", :Dance)
# cards = [card_1, card_2, card_3, card_4]
# deck = Deck.new(cards)
# round = Round.new(deck)

def start
  card_1 = Card.new("Who is the man that would risk his neck for his brother man?", "Shaft! Can you dig it?", :Movies)
  card_2 = Card.new("What does it mean when P-Square asks you to chop their money?", "They no fear, cause e no dey empty.", :Music)
  card_3 = Card.new("Finish this phrase: Kirikou n'est pas grand, ...", "Mais il est vaillant.", :Movies)
  card_4 = Card.new("What dance did Rihanna confuse American audiences with during her 2018 Grammy performance of Wild Thoughts?", "Gwara Gwara", :Dance)
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------"
  puts "This is card number #{(round.turns.count) + 1} out of 4 with #{(deck.count) - 1} left."
  puts "Question: #{deck.cards.first.question}" #won't take current_card method?

  puts "Type in a guess to the question!"
  user_guess = gets.chomp
  round.take_turn(user_guess)
  round.turns.last.feedback

  puts "This is card number #{(round.turns.count) + 1} out of 4 with #{(deck.count) - 1} left."
  puts "Question: #{deck.cards.first.question}"

  puts "Type in a guess to the question!"
  user_guess = gets.chomp
  round.take_turn(user_guess)
  round.turns.last.feedback

  puts "This is card number #{(round.turns.count) + 1} out of 4 with #{(deck.count) - 1} left."
  puts "Question: #{deck.cards.first.question}"

  puts "Type in a guess to the question!"
  user_guess = gets.chomp
  round.take_turn(user_guess)
  round.turns.last.feedback

  puts "This is card number #{(round.turns.count) + 1} out of 4 with #{(deck.count) - 1} left."
  puts "Question: #{deck.cards.first.question}"

  puts "Type in a guess to the question!"
  user_guess = gets.chomp
  round.take_turn(user_guess)
  round.turns.last.feedback



end

start
