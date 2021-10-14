class Game
  # att reader ability to major variables
  attr_reader :deck,
              :round,
              :og_deck_length

  # initialize deck
  def initialize(deck)
    @deck = deck
    @round = Round.new(deck)
    @og_deck_length = deck.count
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

  # end game
  def end_game
    puts "****** Game over! ******"
    puts "You had #{self.round.number_correct} guesses out of #{@og_deck_length} for a total score of #{self.round.percent_correct}%."
    puts "STEM - #{self.round.percent_correct_by_category(:STEM)}% correct"
    puts "Turing Staff - #{self.round.percent_correct_by_category(:Turing_staff)}% correct"
    puts "Pop Culture- #{self.round.percent_correct_by_category(:Pop_culture)}% correct"
  end
end
