class Round
  attr_reader :deck, :turns, :turn_counter, :correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
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

    # add_1_to_turn

  end

  def correct?
    take_turn.guess == take_turn.answer
    true 
  end

  def add_1_to_correct
    @correct += 1
  end


    # method takes a string representing the guess.
    #It should create a new Turn object with the
    #appropriate guess and Card.
    #It should store this new Turn, as well as return it
    #from the take_turn method.
    #Also, when the take_turn method is called, the Round
    #should move on to the next card in the deck.
end
