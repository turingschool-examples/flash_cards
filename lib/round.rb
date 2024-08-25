class Round
  attr_reader :deck,
              :turns
              

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    card = current_card
    turn = Turn.new(guess, card)
    @turns << turn
    @deck.cards.shift   
    turn
  end

  def number_correct
    correct_turn = @turns.select do |turn|
      turn.correct?
    end
    correct_turn.count
  end

  def number_correct_by_category(category)
    correct_in_category = @turns.select do |turn|
      turn.correct? && turn.card.category == category
    end
    correct_in_category.count
  end
  


end