class Round
  attr_reader :deck, :turns, :correct_cards, :incorrect_cards
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, self.current_card)
    @deck.cards.shift
    @turns[-1]
  end

  def number_correct
    incorrect_cards = []
    correct_cards = []
    @turns.each do |turn|
      if turn.correct? == true
        correct_cards << turn
      else
        incorrect_cards << turn
      end
    end
    correct_cards.length
  end

  def number_correct_by_category(category)
    @category_array = []
    @turns.each do |turn|
      if turn.card.category == category
        @category_array << turn
      end
    end

    number_correct = 0

    @category_array.each do |turn|
      if turn.correct?
        number_correct += 1
      end
    end
    number_correct
  end

  def percent_correct
    (self.number_correct.to_f/self.turns.length) * 100.0
  end

  def percent_correct_by_category(category)
    (self.number_correct_by_category(category).to_f/@category_array.length) * 100.0
  end
end
