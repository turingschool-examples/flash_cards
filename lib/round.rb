class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
     @turns << turn
     turn
  end

  def number_correct
    tally = 0
    @turns.count do |turn|
      if turn.correct?
        tally += 1
        break
      end
    end
    tally
  end

  def number_correct_by_category(category)
    tally = 0
    @turns.count do |turn|
      if turn.card.category == category
        tally += 1
        break
      end
    end
    tally
  end


end
