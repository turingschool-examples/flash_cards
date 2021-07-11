require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    index_number = @turns.length % @deck.cards.length #returns to index [0] once number of turns = number of cards; avoids running out of cards for turns
    @deck.cards[index_number]
      #original thought for code below does not account for running out of cards before turns; however my each enumberable in my runner file now accounts for that problem so I could have used this code.
    # @deck.cards[@turns.length]
  end

  def take_turn(current_guess)
    new_turn = Turn.new(current_guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    correct_turns = @turns.find_all do |turn|
      turn.correct?
    end
    correct_turns.length
  end

  def number_correct_by_category(category)
    correct_turns = @turns.find_all do |turn|
      if turn.card.category == category
        turn.correct?
      end
    end
    correct_turns.length
  end

  def percent_correct
    if @turns.length > 0
      percentage_in_progress = number_correct * 100.0
      (percentage_in_progress / @turns.length).round(1)
    else
      0
    end
  end

  def percent_correct_by_category(category)
    turns_in_category = @turns.find_all do |turn|
      turn.card.category == category
    end

    category_number_correct = number_correct_by_category(category)

    if category_number_correct > 0
      category_percentage_in_progress = category_number_correct * 100.00
      (category_percentage_in_progress / turns_in_category.length).round(1)
    else
      0
    end
  end
end





# end
