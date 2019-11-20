#Runs the Flashcard Game

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
card_5 = Card.new("What is the website called to store gits?", "GitHub", :Software)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

round = Round.new(deck)

def start(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "----------------------------"
  until round.current_card == nil
    puts "This is card number #{round.current_card_number + 1} out of #{round.deck.count} cards."
    puts round.deck.cards[round.current_card_number].question
    user_guess = gets.chomp
    round.take_turn(user_guess)
    puts round.turns.last.feedback
  end

  puts "****** Game over! ******"

end

start(round)
