require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  card_4 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"

  round.deck.cards.each.with_index do |card, index|
    puts "This is card number #{index + 1} out of #{deck.count}."
    puts "Question: #{card.question}"


    user_guess = gets.chomp
    turn = round.take_turn(user_guess)

    if turn.correct?
    puts "Correct!"
    else
    puts "Incorrect."
    end

  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct.to_i}%."



  cards.map do |card|
    category = card.category
    puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
  end
end


start()
