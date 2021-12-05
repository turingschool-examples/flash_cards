class Round
  attr_reader :deck,
              :turns,
              :deck_size,
              :correct_turn,
              :turn_count,
              :correct_by_cat
              :incorrect_by_cat

  def initialize(round_deck)
    @deck = round_deck
    @deck_size = @deck.count
    @turns = []
    @correct_turn = []
    @correct_by_cat = []
    @incorrect_by_cat = []
  end

  def start

  end

  def current_card
    @deck.cards.shift
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
    @correct_turn.count
  end

  def number_correct_by_category(input_cat)
    @correct_by_cat = []
    # @incorrect_by_cat = []
    @turns.each do |card_info_check|
      if card_info_check.correct? && (input_cat == card_info_check.grab_cat)
        @correct_by_cat << card_info_check
      # elsif
      #   @incorrect_by_cat << card_info_check
      end
    end
    @correct_by_cat.count
  end

    # number_correct
    # correct_by_cat = []
    # #incorrect_by_cat = []
    # @correct_turn.each do |cat_check|
    #   if cat_check.grab_cat == input_cat
    #       correct_by_cat << cat_check
    #   # else
    #   #   incorrect_by_cat << cat_check
    #   end
    # end
    # return correct_by_cat.count

  def percent_correct
    number_correct.to_f / @turns.count.to_f * 100
  end

  def percent_correct_by_category(by_category)
    num_cards_per_cat = []
    @turns.each do |card|
      if card.grab_cat == by_category
        num_cards_per_cat << card
      end
    end
    return number_correct_by_category(by_category) / num_cards_per_cat.count.to_f * 100.0
  end

end


  # def percent_correct_by_category(by_category)
  #   incorrect_by_cat = []
  #   @turns.each do |card|
  #     if card.card.category != by_category
  #       incorrect_by_cat << card
  #     end
  #   end
  #   a = @correct_by_cat.count + incorrect_by_cat.count
  #   @correct_by_cat.count.to_f / a.to_f * 100
  # end

  # def number_correct_by_category(input_cat)
  #   correct_by_cat = []
  #   current_cat = input_cat
  #   if correct_turn.grab_cat == current_cat
  #     correct_by_cat << correct_turn
  #   end
  # end
