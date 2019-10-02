class Round

  require './lib/turn'
  require './lib/card'
  require './lib/deck'

  attr_accessor :deck, :turns, :count
  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0

  end
  def current_card
    deck.cards.first
  end
  def take_turn(guesses)
   self.turns << Turn.new(guesses, current_card)
  #need to get the shovel into array work
  #need to figure out why the turn.new is not working here...works in repl
  deck.cards.rotate 
  end

  def correct?
    turns.each do |turn|
     if turn.guesses = card.answer
      "Correct."
      count += 1
    else
      "Incorrect."
    end
  end
  def number_correct
  end
  def count
  end
  def last
    self
  end
  def feedback
  end
  def number_correct_by_category(category)
  end
  def percent_correct
  end
  def percent_correct_by_category(category)
  end

end
