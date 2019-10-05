require_relative './turn'
require_relative './deck'
require_relative './card'

class Round
  attr_reader :deck, :correct_answers

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[0])
    @deck.cards.slice!(0)
    @turns.last
  end

  def number_correct
    correct_answers = 0
    used_cards = @turns.last
    @turns.each do |turn|
      if turn.correct? == true
        correct_answers += 1
      end
    end
    correct_answers
  end

  def number_correct_by_category(category_correct)
    count = 0
    num_correct = @turns.select {|turn_c| turn_c.card.category == category_correct}
    num_correct.each do |turn_category|
      if turn_category.correct? == true
        count += 1
      end
    end
    count
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f * 100).round(1)
  end

  def percent_correct_by_category(category)
    cat_correct = @turns.select {|turn_c| turn_c.card.category == category}
    (number_correct_by_category(category).to_f / cat_correct.count.to_f  * 100).round(1)
  end

end
