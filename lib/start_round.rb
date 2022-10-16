require './lib/game_setup'
def start(input)
  if input.downcase == 'start'
    until @round.turns.length == @round.deck.count
      system 'clear'
      puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.count}"
      puts "Question: #{@round.current_card.question}"
      puts "Type your guess:"

      guess = gets.chomp
      @round.take_turn(guess)
      puts @round.turn_feedback
      puts '------------------------------------------------------------'
      if @round.turns.length  < @round.deck.count
        puts 'Hit enter for next'
      else
        puts 'End Game'
      end
      gets.chomp
    end


    system 'clear'
    puts "****** Game Over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.count} for a total score of #{@round.percent_correct}%."
    @round.deck.category_groups.each do |category, card|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end
