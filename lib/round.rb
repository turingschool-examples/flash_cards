class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards.first
    #deck.cards.shift
    #deck.cards.rotate!(1)
  end

  def take_turn(new_guess)
    new_turn = Turn.new(new_guess, current_card)
    #require 'pry'; binding.pry
    @turns << new_turn
    if new_guess == current_card.answer
      @number_correct += 1
    end
    deck.cards.rotate!
    #might need to edit
    return new_turn
  end

end
