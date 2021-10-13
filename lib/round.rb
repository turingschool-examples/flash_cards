class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck =  deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn_guess = Turn.new(guess, current_card)
    @turns << turn_guess
    turn_guess
  end

  def number_correct
    amount_turns_correct = 0
    @turns.each do |turn|
      if turn.correct? == true
        amount_turns_correct += 1
      else
        amount_turns_correct += 0
      end
    end
    amount_turns_correct
  end
end
