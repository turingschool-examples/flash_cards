class Game

  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @round = Round.new(deck)
  end

  def start
    # print out starting things
    puts "Welcome! You're playing with #{@deck.cards.length} cards"
    puts "-------------------------------------------------------"
    # call report method
    self.report
  end

  # create a report method that can be called at every new turn.
  def report
    puts "This is card number #{@round.turns.length} out of #{@deck.cards.length}"
    puts "Questions: #{@round.current_card.question}"
  end
end
