class Round
  attr_reader :deck, :turns, :correct_turn

  def initialize(round_deck)
    @deck = round_deck
    @turns = []
    @correct_turn = []
  end

  def current_card
    deck.draw
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @turns << current_turn
    return current_turn
  end

  def number_correct
    @turns.each do |accuracy_check|
      if accuracy_check.correct?
        @correct_turn << accuracy_check
      end
    end
    return correct_turn.count
  end

  def number_correct_by_category(input_cat)
    correct_by_cat = []
    @turns.each do |cat_check|
      if cat_check.grab_cat == input_cat
        correct_by_cat << cat_check
      end
    end
    return correct_by_cat.count
  end







end
