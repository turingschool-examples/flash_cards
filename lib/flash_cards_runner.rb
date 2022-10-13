require './card'

require './turn'

require './deck'

require './round'

card_1 = Card.new("Who created VW Beetle?", "Ferdinand Porsche", :History)

card_2 = Card.new("What is 6x8?", "48", :Math)

card_3 = Card.new("What is the capital of Sweden?", "Stockholm", :Geography)

card_4 = Card.new("Who was the first European to set foot in North America?", "Lief Ericsson", :History)

card_5 = Card.new("Who has won the most Formula 1 Grands Prix?", "Lewis Hamilton", :Sports)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

$round = Round.new(deck)

$round_count = $round.deck.count

def start
  puts "Welcome! You are playing with #{$round_count} cards."
  puts "--------------------------------------------------"
  $round_count.times do
    puts "This is card number #{$round.card_number} out of #{$round_count}."
    puts "Question: #{$round.current_card.question}"
    $round.take_turn(gets.chomp)
    puts $round.turns.last.feedback
  end
  puts "****** Game over! ******"
  puts "You had #{$round.number_correct} guesses out of #{$round_count.to_i} for a total score of #{$round.percent_correct.to_i}%."
  puts 

end


start
