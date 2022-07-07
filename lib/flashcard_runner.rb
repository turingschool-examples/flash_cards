require './lib/round'

# collect cards from flashcards.txt
cards = []
File.open('lib/flashcards.txt', 'r') do |file|
    
    for line in file.readlines()
        import_card = line.split("/")
        card = Card.new(import_card[0], import_card[1], import_card[2].strip.to_sym)
        cards << card
    end
    
end

# randomize cards array
cards = cards.sample(cards.count)

# initialize a new Deck with the cards array
deck = Deck.new(cards)

# initialize a new Round taking the Deck as an argument
round = Round.new(deck)

# start the game
round.start

# run through questions, providing feedback for correct or incorrect answers
(round.total_cards).times do
    puts "This is card number #{round.turn_count} out of #{round.total_cards}."
    puts "Question: #{round.current_card.question}"
    # gather and clean up user input
    answer = gets.chomp.split.map(&:capitalize).join(" ")
    round.take_turn(answer, round.current_card)
    puts round.turns.last.feedback
    puts " "
end

# end the game, display scores
puts "*" * 5 + "Game over!" + "*" * 5

# display total percentage of correct answers
puts "You had #{round.correct_answers} correct guesses out of #{round.total_cards} for a total score of %#{round.percent_correct}."

# display percent correct by categories
round.categories.each do |category|
    puts "#{category} - %#{'%.1f' % (round.percent_correct_by_category(category))} correct"
end

puts "\n\n"