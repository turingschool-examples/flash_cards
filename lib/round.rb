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
      correct = 0
      @turns.each do |turn|
        if turn.correct? 
        correct += 1
        end
    end
    correct
  end
  


end