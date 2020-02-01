class Round
  attr_reader :deck, :turns, :guess
  def initialize(deck)
    @deck = deck
    @turns = []
  end

#this method needs to return the first card in the deck and once a guess is made and recorded the next card in the deck becomes the current card
  def current_card
    @deck.cards.first
  end
#the "!" in .rotate! is basically the same as doing this
#current = @deck.cards.rotate
  def get_new_card
    @deck.cards.rotate!
    # require "pry"; binding.pry
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    get_new_card
    @turns << turn
    turn
  end

  def number_correct
    num_correct = 0
    @turns.each do |turn|
      if turn.correct?
        num_correct = num_correct + 1
      end
    end
    num_correct
  end
end
