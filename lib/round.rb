class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0
    @current_card = @deck.cards[0]
    @number_correct = 0
    # @number_wrong = 0
  end

  def current_card
    current_card = @deck.cards[@count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn

    if turn.correct? == true
      @number_correct += 1
    end

    @turns.last
  end
  def number_correct
    @number_correct
  end


  def turns
    @turns
  end
  # def number_wrong
  #   @current_card << @current_card.shift
  #   @number_wrong
  # end
end
