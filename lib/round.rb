class Round
  attr_accessor :deck, :turns, :turn_count,:number_correct, :initial_card_count
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = []
    @turn_count
    @current_card
    @number_correct = 0
    @initial_card_count = @deck.cards.count
  end

  def current_card
    if @deck.cards.count > 0
      @current_card = deck.cards[0]
    else
      "No more cards left in deck"
    end
  end

  def take_turn(answer)
    card = self.current_card
    turn1 = Turn.new(answer, card)
    deck.cards.shift
    turns << turn1
    if turn1.correct?
      @correct << turn1
      @number_correct += 1
    end
    turn1
  end

  def number_correct_by_category(category)
    @correct.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct
    correct = self.number_correct
    total = @initial_card_count
    if total > 0
      "#{((correct.to_f) / (total.to_f)*100).to_i}%"
    else
      "No questions answered yet"
    end
  end

  def percent_correct_by_category(category)
    correct = self.number_correct_by_category(category)
    total = @turns.count do |turn|
      turn.card.category == category
    end
    if total > 0
      "#{((correct.to_f) / (total.to_f)*100).to_i}%"
    else
      "No questions answered in this category yet"
    end
  end

end