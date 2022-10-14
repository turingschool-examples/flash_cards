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
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    correct_answer_count = 0
    turns.each do |turn|
      if turn.correct? == true
        correct_answer_count += 1
      end
    end
    correct_answer_count
  end

  def number_correct_by_category(turn_category) 
    turns_in_category = []
    @turns.each do |turn|
      if turn.card.category == turn_category
        turns_in_category << turn
      end
    end
    correct_by_category = 0
    turns_in_category.each do |turn|
      if turn.feedback == "Correct!"
        correct_by_category += 1
      end
    end
      correct_by_category
  end
end