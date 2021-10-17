class Round
  attr_reader :deck, :turns
  def initialize(deck, turns = [])
    @deck = deck
    @turns = turns
  end
  def current_card
    deck.cards[0]
  end
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards.rotate!
    new_turn
  end
  def number_correct
    correct_answers = []
    turns.each do |turn|
      if turn.correct? == true
        correct_answers << turn
      end
    end
    correct_answers.length
  end
  def number_correct_by_category(category)
    @turns.select do |turn|
      turn.card.category == category && turn.correct? == true
    end.length
  end
  def number_incorrect_by_category(category)
    @turns.select do |turn|
      turn.card.category == category && turn.correct? == false
    end.length
  end
  def percent_correct
    (number_correct.to_f/@turns.length.to_f) * 100
  end
  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f/(number_incorrect_by_category(category).to_f + number_correct_by_category(category).to_f)) * 100
  end
end
