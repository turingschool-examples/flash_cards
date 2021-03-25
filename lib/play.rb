class Play

  def initialize(round)
    @round = round
  end

  def start
    puts "Welcome! You're playing with #{@round.deck.count} cards."
    puts "----------------------------------------------------"
  end

  def end_game
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.length} for a total score of #{@round.percent_correct}%."
  end

  def card_review
    while @round.turns.length < @round.deck.count
      puts "This card is number #{@round.turns.length + 1} of #{@round.deck.count}."
      puts "Question: #{@round.current_card.question}"
      guess = gets.chomp
      @round.take_turn(guess)
      puts @round.turns.last.feedback
    end
    self.end_game
  end

  def unique_categories
    all_categories = []
    @round.deck.cards.each do |card|
      all_categories << card.category
    end
    unique_categories = all_categories.uniq
  end

  def score_by_category
    self.unique_categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
  end

end
