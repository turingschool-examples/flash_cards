class Game
  # att reader ability to major variables
  attr_reader :deck,
              :round,
              :og_deck_length,
              :categories

  # initialize deck
  def initialize(deck)
    @deck = deck
    @round = Round.new(deck)
    @og_deck_length = deck.count
    @categories = @deck.get_categories
  end

  #method
  def start
    # print out starting things
    puts "Welcome! You're playing with #{@og_deck_length} cards"
    puts "-------------------------------------------------------"
  end

  #method to ask a question
  def ask
    puts "This is card number #{@round.turns.length + 1} out of #{@og_deck_length}."
    puts "Question: #{@round.current_card.question}"
  end

  # check guess, report feedback, go to next card
  def take_guess(guess)
    @round.take_turn(guess)
    puts round.turns[-1].feedback
  end

  def print_perc_correct(category)
    "#{category} - #{self.round.percent_correct_by_category(category)}% correct"
  end

  # end game
  def end_game
    puts "****** Game over! ******"
    puts "You had #{self.round.number_correct} guesses out of #{@og_deck_length} for a total score of #{self.round.percent_correct}%."
    @categories.each do |category|
      puts print_perc_correct(category)
    end
  end
end
