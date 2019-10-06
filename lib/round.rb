

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
    player_turn = Turn.new(guess,current_card)
    @turns << player_turn
    @deck.cards.shift
    player_turn
  end

  def number_correct
    number_of_correct_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        number_of_correct_guesses += 1
      end
    end
    number_of_correct_guesses
  end

  def number_cat_correct(cat)
    number_correct_in_category = 0
    @turns.each do |turn|
      if turn.card.category == cat && turn.correct?
          number_correct_in_category += 1
        end
    end
  number_correct_in_category
end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f * 100).round(1)
  end

  def percent_correct_by_category(cat)
    total_correct_in_category = 0
      @turns.each do |turn|
        if turn.card.category == cat
          total_correct_in_category += 1
        end
      end
      total_correct_in_category
    (number_cat_correct(cat).to_f / total_correct_in_category.to_f * 100).round(1)
  end
end
