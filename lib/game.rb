class Game

  attr_reader :round
  def initialize(round)
    @round = round
  end

  def play
    puts "Welcome! You're playing with #{@round.deck.count} cards."
    puts "-------------------------------------------------"
    rounds = @round.deck.count
    while rounds > 0 do
      puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.count}."
      puts "Question: #{@round.current_card.question}"
      turn = @round.take_turn(gets.chomp)
      puts turn.feedback
      rounds -= 1
    end
    game_summary
  end

  def game_summary
    puts "****** Game over! ******"
    if @round.number_correct == 1
      puts "You had #{@round.number_correct} correct guess out of #{@round.deck.count} for a total score of #{@round.percent_correct.round}%."
    else
      puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.count} for a total score of #{@round.percent_correct.round}%."
    end
    @round.list_categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category).round}% correct"
    end
  end
end
