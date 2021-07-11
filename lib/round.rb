class Round 
  attr_reader :deck, :turns, :number_correct, :used_cards, :correct_by_category
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_by_category = Hash.new(0)
    @used_cards = []
  end

  def current_card
    @deck.cards.first
  end

  def guess 
    gets.chomp.downcase
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    check_if_correct(new_turn)
    @used_cards << @deck.cards.shift
    new_turn
  end

  def check_if_correct(turn)
    if turn.correct?
      @number_correct += 1
      @correct_by_category[turn.card.category] += 1
    end
  end

  def number_correct_by_category(category)
    @correct_by_category[category]
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f).round(1) * 100
  end

  def percent_correct_by_category(category)
    cards_in_category = @used_cards.find_all do |card|
      card.category == category
    end
    (number_correct_by_category(category).to_f / cards_in_category.length.to_f).round(1) * 100
  end
end