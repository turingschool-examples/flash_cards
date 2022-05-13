class Round
  attr_reader :deck, :turns, :turn_counter, :correct, :num
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
    @num = 0
  end

  def current_card #method current_card
    @deck.cards[0]
  end

  def add_1_to_turn
    @turn_counter += 1
  end

  def take_turn(guess)
    new_turn = Turns.new(guess, current_card)

      if new_turn.guess == new_turn.card.answer
        add_1_to_correct
      end
    @turns << new_turn
  end

  def correct?
    take_turn.guess == take_turn.answer
    true
  end

  def add_1_to_correct
    @correct += 1
    return @correct
  end


  def number_correct
    add_1_to_turn
  end
  
end
