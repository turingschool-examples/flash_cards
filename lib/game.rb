class Game
  attr_reader :round
  def initialize(round)
    @round = round
  end

  def start
    puts "Welcome! You're playing with #{number_of_cards} cards."
    puts "-------------------------------------------------"
    #loop
    @round.deck.cards.length.times do
      puts "This is card #{@round.turns.length + 1} out of #{number_of_cards}."
      puts "Question: #{@round.current_card.question}"
      answer = gets.chomp
      new_turn = round.take_turn(answer)
      puts "#{new_turn.feedback}"
    end
      puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.length} for a total score of #{@round.percent_correct}%."
      
      #print stats
  end

  def number_of_cards
    @round.deck.cards.length
  end
end
