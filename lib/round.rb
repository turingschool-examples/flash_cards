class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_wrong = 0
  end

  def current_card
    @current_card = deck.cards[0]
  end

  def take_turn(guess)
    turn_var = Turn.new(guess, current_card)
    if turn_var.correct?
      @number_correct += 1
    end
    # @deck.cards.shift
    @turns << turn_var
    turn_var
  end

  def turns
    @turns
  end

  def number_correct
    @number_correct
  end


  # def number_wrong
  #   @current_card << @current_card.shift
  #   @number_wrong
  # end


end
