class Round

attr_reader :deck,
            :turns,
            :correct_container

  def initialize(deck)
    @deck              = deck
    @turns             = []
    @correct_container = 0
  end

  def current_card
    current_card = @deck.cards.first
  end

  def take_turn(guess) #How to align?
    container = Turn.new(guess, current_card)

    if guess == @deck.cards.first.answer
      @correct_container += 1
    end

    @turns << container
    deck.cards.rotate!
    return container
  end

  def number_correct
    return @correct_container
  end

end
