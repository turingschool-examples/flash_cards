class Game

  attr_reader :deck
              :og_deck_length

  def initialize(deck)
    @deck = deck
    @round = Round.new(deck)
    @og_deck_length = deck.cards.length
  end

  def start
    # print out starting things
    puts "Welcome! You're playing with #{@og_deck_length} cards"
    puts "-------------------------------------------------------"
    # call report method
    self.report
  end

  # create a report method that can be called at every new turn.
  def report
    puts "This is card number #{@round.turns.length} out of #{@og_deck_length} /n
          Questions: #{@round.current_card.question}"
  end

  # check guess, report feedback, go to next card
  def take_guess(guess)
    puts guess
    @round.take_turn(guess)
    puts round.turns[-1].feedback
    self.report
    if round.deck.card.length == 0
      self.end_game
    end
  end

  # end game
  def end_game
    puts "*** Game over! ***"
    puts "You had #{self.round.number_correct} guesses out of #{@og_deck_length}"
    puts "STEM - #{self.round.percent_correct_by_category(:STEM)}% correct"
    puts "Turing Staff - #{self.round.percent_correct_by_category(:Turing_staff)}% correct"
    puts "Pop Culture- #{self.round.percent_correct_by_category(:Pop_culture)}% correct"
  end
end
