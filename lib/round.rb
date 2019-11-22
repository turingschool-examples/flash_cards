class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    number_of_cards_correct = 0
    @turns.each do |turn|
      if turn.correct?
        number_of_cards_correct += 1
      end
    end
    number_of_cards_correct
  end

  def number_correct_by_category(category)
    


  end


end
