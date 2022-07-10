require './lib/round'

card_1 = Card.new("What is the capital of Colorado?", "Denver", "Colorado Facts")
card_2 = Card.new("How many onces are in a cup?", "8", :Cooking)
card_3 = Card.new("What is the state flower of Colorado?", "Columbine", "Colorado Facts")
card_4 = Card.new("Blue Jeans were invented by Levi Strauss and Jacob Davis, in what year?", "1873", :Fashion)
card_5 = Card.new("How many teaspoons are in a tablespoon?", "3", :Cooking)
card_6 = Card.new("Historically what color was only allowed to be worn by royalty?", "Purple", :Fashion)
card_7 = Card.new("Every year about 160,000 people send a letter to what Colorado city just for a postmark?", "Loveland", "Colorado Facts")
card_8 = Card.new("At what internal temperature (F) is chicken safe to consume?", "165 degrees", :Cooking)
card_9 = Card.new("Paisley is a print motive that got its name from a city in what contry?", "Scotland", :Fashion)
card_10 = Card.new("What book series did J.K. Rowling become famous for writing?", "Harry potter", "Just for Fun")

deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10])

round = Round.new(deck)

puts "Enter 'Start' - To Begin Flashcards\n\n"

print "> "
start = gets.chomp

if start.capitalize == "Start"
  puts " "
  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-" * 60

  turn_number = 0
  starting_deck_count = deck.count
  until deck.count == 0
    turn_number += 1
    puts "This is card number #{turn_number} out of #{starting_deck_count} cards."
    puts "Question: #{round.current_card.question}"
    print "> "
    guess = gets.chomp
    round.take_turn(guess.capitalize)
    puts round.turns.last.feedback
    puts " "
  end

  puts "* " * 8 + " Game Over! " + " *" * 8

  puts "You had #{round.number_correct} correct guesses out of #{starting_deck_count} for a total score of #{round.percent_correct.to_i}%."

  puts " "
  card_categories = []
  round.turns.each do |turn|
    card_categories << turn.card.category
  end
  (card_categories.uniq).each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
  end
end
