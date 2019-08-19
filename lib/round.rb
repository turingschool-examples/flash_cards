class Round
  attr_reader :deck, :turns, :current_card, :take_turn

  def initialize(deck_param)
    @deck = deck_param
    # ^@deck is calling entire class
    @turns = []
    @current_card = deck_param.cards_in_deck.first
  end

  def take_turn(guess_param)
    new_turn = Turn.new(guess_param, @current_card)

    @turns << new_turn



    new_turn
  end



end
