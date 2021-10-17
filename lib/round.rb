class Round

  attr_accessor :deck, :turns
  attr_reader :current_card_position

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_position = 0
  end

  def current_card
    @deck.cards[@current_card_position]
  end

  def take_turn(user_guess)
    turn = Turn.new(user_guess,current_card)
    turns << turn
    @current_card_position += 1
    turn
  end

  def number_correct
    correct_counter = 0
    turns.each do |turn|
      if turn.correct?
        correct_counter += 1
      end
    end
    correct_counter
  end

  def number_correct_by_category(category) # Forgot I  had cards_in_category method in Deck class.
    correct_counter = 0
    filtered_by_category = turns.select{|turn| turn.card_data.category == category}

    filtered_by_category.each do |count|
      if count.correct?
        correct_counter += 1
      end
    end
    correct_counter
  end

  def percent_correct
    number_correct.to_f / turns.length.to_f * 100.0
  end

  def percent_correct_by_category(category)
      total_in_category = turns.select{|turn| turn.card_data.category == category}

      number_correct_by_category(category).to_f / total_in_category.length.to_f * 100.0
  end
end
