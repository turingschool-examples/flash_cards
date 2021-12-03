class Round
  attr_reader :deck, :turns, :correct_turn, :incorrect_by_cat

  def initialize(round_deck)
    @deck = round_deck
    @turns = []
    @correct_turn = []
      #@named_category = named_category
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
    number_correct
    correct_by_cat = []
    #incorrect_by_cat = []
    @correct_turn.each do |cat_check|
      if cat_check.grab_cat == input_cat
          correct_by_cat << cat_check
      # else
      #   incorrect_by_cat << cat_check
      end
    end
    return correct_by_cat.count
  end



  def percent_correct
    a = number_correct / @turns.count.to_f
    a * 100
  end

  def percent_correct_by_category(by_category)
    incorrect_by_cat = []
    @turns.each do |thing|
      if thing.grab_cat != by_category
        incorrect_by_cat << thing
      end
    end
    a = number_correct_by_category(by_category).to_f
    b = incorrect_by_cat.count
    a / b * 100
end

  # def number_correct_by_category(input_cat)
  #   correct_by_cat = []
  #   current_cat = input_cat
  #   if correct_turn.grab_cat == current_cat
  #     correct_by_cat << correct_turn
  #   end
  # end





end
