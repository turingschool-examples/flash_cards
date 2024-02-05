class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0

  end

  def current_card
    @deck.current_card
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def new_turn
    correct?
  end

  def number_correct
      @turns.each do |turn|
        turn.correct? == true
        @correct += 1
    end
    @correct
  end



end