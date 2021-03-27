class Play
def initialize
end

def start
  puts "Welcome! You're playing with #{round.deck.count} cards.
      -------------------------------------------------
        This is card number #{turns.count + 1} out of #{deck.count}.
        Question: #{current_card.question}?
        Type answer below"

  @guess = gets.chomp
  take_turn(@guess)
  if @guess == current_card.answer #this needs to be if correct?
    p "Correct!"
  elsif @guess != current_card.answer
    p "Incorrect"
  else
    p "keep trying Alex"
  end
end

end
