class Start

   def initialize(deck)
      @deck = deck
      @round = Round.new(deck)
   end

   def welcoming_message 
      puts "Welcome! You are playing with #{@deck.cards.length} cards"
      puts "----------------------------------------------------"
   end

   def run_the_game
      @deck.cards.each do |card|
      puts "This is card #{(@round.turns.length) + 1} out of #{@deck.cards.length}"
      puts "Question: #{@round.current_card.question}"
      puts "Answer:"
      user_guess = gets.chomp
      
      turn = @round.take_turn(user_guess)
      puts turn.feedback
      end
   end
      
   def ending_message
      puts "****** Game Over! ******"
      puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.length} for a total of #{@round.percent_correct}%"
      
      unique_categories = @deck.cards.map { |card| card.category }.uniq
      
      unique_categories.each do |category|
      category_percent = @round.percent_correct_by_category(category)
      puts "Percentage correct in #{category}: #{category_percent}%"
      end
      puts "----------------------------------------------------"
   end

   def start
      welcoming_message
      run_the_game
      ending_message   
   end
end