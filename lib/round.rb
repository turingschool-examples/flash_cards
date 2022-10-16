class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    cur_index = turns.length
    cur_turn = Turn.new(guess,deck.cards[cur_index])
    turns << cur_turn
    cur_turn
  end

  def current_card
    deck.cards[turns.length]
  end

  def number_correct
    # can't have gotten any correct if no turns have been played
    if turns.length == 0
      return 0
    else
      num_correct = 0
      turns.each do |turn|
        num_correct += 1 if turn.correct?
      end
      num_correct
    end
  end

  def number_correct_by_category(category)
    if turns.length == 0
      return 0
    else
      num_correct_by_cat = 0
      turns.each do |turn|
        num_correct_by_cat += 1 if turn.correct? && turn.card.category == category
      end
      num_correct_by_cat
    end
  end

  def percent_correct
      # all percents rounded to 1 decimal place
      if turns.length == 0
        return nil
      else
        ((number_correct.to_f / turns.length)*100).round(1)
      end
  end

  def percent_correct_by_category(category)
    if turns.length == 0
      return nil
    else
      num_questions_category = 0
      turns.each do |turn|
        num_questions_category += 1 if turn.card.category == category
      end
      ((number_correct_by_category(category) / num_questions_category.to_f)*100).round(1)
    end
  end
end
