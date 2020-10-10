class Round

  attr_reader :deck, :turns

  def initialize (deck, turns = [])
    @deck = deck
    @turns = turns
  end

  def current_card
    deck.cards[@turns.length]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    # is there a simpler way to do this without each? figure it out!
    count = 0
    turns.each do |turn|
      if turn.correct?
      count += 1
      end
    end
    count
  end

  def number_correct_by_category(cat)
    cat_correct = []
    turns.find_all do |turn|
      if card.category == cat
        cat_correct << turn
      end
    end
    cat_correct.count
  end
end
