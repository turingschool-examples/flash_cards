class Round

  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(player_guess)
    new_turn = Turn.new(player_guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    number_of_cards_correct = 0
    @turns.each do |turn|
        if turn.correct?
          number_of_cards_correct += 1
        end
    end
    number_of_cards_correct
  end

  def number_of_turns_in_category(category)
    turns_in_category = []
    @turns.each do |turn|
      if turn.card.category == category
        turns_in_category << turn
      end
    end
    turns_in_category
  end

  def number_correct_by_category(category)
    number_of_correct_turns_in_category = 0
    number_of_turns_in_category(category).each do |turn|
      if turn.correct?
        number_of_correct_turns_in_category += 1
      end
    end
    number_of_correct_turns_in_category
  end

  def percent_correct
    p_correct = number_correct.to_f / @turns.count.to_f * 100.0
    p_correct.to_i
  end

  def percent_correct_by_category(category)
    p_correct_category = number_correct_by_category(category).to_f / number_of_turns_in_category(category).count.to_f * 100.0
    p_correct_category.to_i
  end
end
