class Round
  attr_reader :turns, :deck, :cards, :card_counter, :number_correct, :answer
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_counter = -1
    @number_correct = 0
  end


  def current_card
    self.deck.cards[@card_counter]
  end


  def take_turn(guess)
    @card_counter += 1
    @turns.push Turn.new(guess, current_card)
    return @turns.last
  end

  def correct?
    if self.turns.last.guess == self.turns.last.answer
      true
      @number_correct += 1
    else
      false
    end
  end


end
