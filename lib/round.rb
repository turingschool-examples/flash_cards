class Round
require "pry"
  attr_reader :deck, :turns, :turn_number, :num_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 1
    @num_correct = 0
  end

  def current_card
    self.deck.cards.first
  end

  def next_card
    self.deck.cards.shift
    @turn_number += 1
  end

  def take_turn(guess)
    card = self.current_card
    turn = Turn.new(guess, card)
    puts turn.feedback
    if turn.correct? == true
      @num_correct += 1
    end
    @turns << turn
    next_card
  end

  def start
    puts "Welcome! You're playing with #{self.cards_length} cards."
    puts "----------------------------"
  end

  def counter
    @turn_number
  end

  def cards_length
     self.deck.cards.length
  end

  def display_turn
    puts "This is card number #{self.counter} out of #{self.cards_length + self.turns.length}."
    puts "Question: #{self.current_card.question}"
    guess = gets.chomp
    take_turn(guess)
  end

  def end_turn
    puts "****** Game Over! ****** "
    puts "You had #{@num_correct} correct guesses out of #{self.deck.cards.length + self.turns.length} for a total score of #{self.percent_correct}%."
  end



  def percent_correct
    percent = @num_correct.to_f / @turns.length.to_f
    return (percent * 100).truncate(2)
  end

  def categorize

  end




end
