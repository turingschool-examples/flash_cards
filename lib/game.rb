class Game
  attr_accessor :counter

  def initialize
    @counter = 0
  end

  def start(round)
    puts "Welcome! You're playing with #{round.deck.cards.count} cards."
    puts "--------------------------------------------------"

    round.deck.cards.count.times do
      puts "This card is #{@counter += 1} out of #{round.deck.cards.count}"
      puts "Question: #{round.deck.cards[0].question}"
      print "Enter guess: "
      guess = gets.chomp
      puts "#{round.take_turn(guess).feedback}"
      puts ""
    end
  end

  def end_game(round)
    puts "****** Game Over! ******"
    if round.number_correct <= 1
      puts "You had #{round.number_correct} correct guess out of #{round.cards.count} for a total score of #{round.percent_correct}%."
    else
      puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct}%."
    end
    puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    puts "Turing Staff - #{round.percent_correct_by_category(:Turing)}% correct"
    puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"
    puts ""
    puts "Thank you for playing!"
  end

end
