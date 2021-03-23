class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct_count = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    @turns.each do |turn|
      if turn.correct? == true
        @number_correct_count += 1
      end
    end
    @number_correct_count
  end

  def percent_correct
    result = (number_correct / @turns.count.to_f) * 100
  end

  def correct_card
    correct = []
    @turns.each do |turn|
      if turn.correct? == true
        correct << turn
      end
    end
    correct
  end

  def correct_cards
    array = []
    @turns.each do |turn|
      if turn.correct?
        array << turn.card
      end
    end
    array
  end

  def number_correct_by_category(category)
    array = []
    correct_cards.each do |card|
      if card.category == (category)
        array << card
      end
    end
    array.count
  end

  def turns_by_category(category)
    array = []
    @turns.each do |turn|
      if turn.card.category == category
        array << turn
      end
    end
    array.count
  end

  def percent_correct_by_category(category)
    result = (number_correct_by_category(category) / turns_by_category(category)) * 100.0
  end
end
