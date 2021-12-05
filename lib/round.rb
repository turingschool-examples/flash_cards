class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
# binding.pry
  end

  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct? == true
        correct_guesses += 1
      end
    end
    return correct_guesses
  end

  def number_correct_by_category
  end

  def percent_correct
  end

  def percent_correct_by_category
  end
end
