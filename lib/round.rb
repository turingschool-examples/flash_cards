class Round
  attr_reader :obj_deck, :obj_turns

  def initialize(input_deck)
    @obj_deck = input_deck
    @obj_turns = []
  end

  def deck
    self.obj_deck
  end

  def turns
    self.obj_turns
  end

  def current_card # Read first element of our deck array using our .cards class method
    self.obj_deck.cards[0]
  end


  def take_turn(user_guess)

  end

  def number_correct

  end

  def number_correct_by_category

  end

  def percent_correct

  end



end
