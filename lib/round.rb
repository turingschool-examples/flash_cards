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
    # instantiate a new turn
    turns << turn
    # push turn into turns array
    old_card = @deck.cards.shift
    # move old card (first element) and destroys it
    @deck.cards.push(old_card)
    # move the old card to end of deck array
    turn
    # returns turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct? == true
        correct += 1
      end
    end
    return correct
  end

  def number_correct_by_category(category)
    correct_by_category = 0
    @turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
        correct_by_category += 1
      end
    end
    return correct_by_category
  end

  def percent_correct

    percent = number_correct.to_f/@turns.count.to_f * 100

  end

  def percent_correct_by_category(category)

    percent = number_correct_by_category(category).to_f/@turns.count.to_f * 100

  end

end
