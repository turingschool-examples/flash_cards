
class Round

  attr_reader :deck, :turns, :current_card, :number_correct #:card_cards

  def initialize (deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
    @correct_cards = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
      if new_turn.correct?
        @number_correct += 1
      end
    @deck.rotate_cards
    @current_card = @deck.cards[0]
    return new_turn
  end



end
