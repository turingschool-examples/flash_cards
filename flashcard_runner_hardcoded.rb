require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


def start

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  card_4 = Card.new("What is the capital of New York state?", "Albany", :Geography)

  card_5 = Card.new("Who is the wizarding protagonist in the 7 part series written by J.K. Rowling?", "Harry Potter", :Pop_Culture)

  card_6 = Card.new("Name the fruit based company whose operating system is preferred by Turing.", "Apple", :Pop_Culture)

  deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])


  round = Round.new(deck)

  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-" * 40

  until round.current_card_position == round.deck.cards.count
    puts "This is card number #{round.current_card_position+1} of #{round.deck.count}."
    puts "Question: #{round.deck.cards[round.current_card_position].question}"
    print "Type answer then press enter: "
    user_guess = gets.chomp
    new_turn = round.take_turn(user_guess)
    puts "#{round.turns.last.feedback}"
    puts "-" * 40
  end

  puts "*" * 10 + " GAME OVER! " + "*" * 10
  puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct.round(2)}%."

  round.deck.get_all_categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
  end
end

start
