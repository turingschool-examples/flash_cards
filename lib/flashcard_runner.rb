require './lib/round'

# make a number of cards for the game
card_1 = Card.new("Where is Gruner Veltliner most popularly cultivated?", "Austria", :Wine)

card_2 = Card.new("Would you generally expect a Kabinett Riesling to be Dry, Off-Dry, or Sweet?", "Off-Dry", :Wine)

card_3 = Card.new("What heavily oxidized wine is a specialty of the Jura?","Vin Jaune", :Wine)

card_4 = Card.new("Which regional cuisine is credited with the invention of Salt Cod, or Bacalao?", "Basque", :Food)

card_5 = Card.new("What is the Latin name for the leafy edible herb often foraged in California and also known as sour grass?", "Oxalis", :Food)

card_6 = Card.new("Where are Malpeque Bay oysters harvested?", "Prince Edward Island", :Food)

card_7 = Card.new("What popular grape variety is known as Spatburgunder in Germany?", "Pinot Noir", :Wine)

card_8 = Card.new("What region in New York is known for its high-quality Rieslings?", "Finger Lakes", :Wine)

# collect all created cards in an array - is this something I could automate later?
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]

# initialize a new Deck with the cards array
deck = Deck.new(cards)

# initialize a new Round taking the Deck as an argument
round = Round.new(deck)

round.start

(round.total_cards).times do
    puts "This is card number #{round.turn_count} out of #{round.total_cards}."
    puts "Question: #{round.current_card.question}"
    answer = gets.chomp
    round.take_turn(answer, round.current_card)
    puts round.turns.last.feedback
    puts " "
end

puts "*" * 5 + "Game over!" + "*" * 5
puts "You had #{round.correct_answers} correct guesses out of #{round.total_cards} for a total score of %#{round.percent_correct}."

round.collect_category

round.categories.each do |category|
    puts "#{category} - %#{'%.1f' % (round.percent_correct_by_category(category))} correct"
end

puts "\n\n"