class Round

  attr_reader :deck, :turns, :turn_number
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 1
  end

  def current_card
    self.deck.cards.first
  end

  def next_card
    self.deck.cards.shift
  end

  def take_turn(guess)
    card = self.current_card
    turn = Turn.new(guess, card)
    puts turn.feedback
    @turns << turn
    @turn_number += 1
    self.next_card
  end

  def start
    puts "Welcome! You're playing with #{self.deck.cards.length} cards."
    puts "----------------------------"
  end

  def counter
    @turn_number
  end

  def display_turn
    puts "This is card number #{self.counter} out of #{self.deck.cards.length}."
    puts "Question: #{self.current_card.question}"
    guess = gets.chomp
    self.take_turn(guess)
  end


end
