
class Round

  attr_reader :deck,
              :turns,
              :correct


  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    # new_turn = Turn.new(guess, current_card)
    @turns << Turn.new(guess, current_card)
    deck.cards.rotate!
    # @turns.last
  end

  def number_correct
    if @turns.last.correct? == true
      @correct += 1
    end
    @correct
  end

  def number_correct_by_category(category_arg)
    category_correct = 0
    @turns.each do |turn|
      if turn.card.category == category_arg && turn.correct? == true
        category_correct += 1
      end
    end
    category_correct
  end

  def percent_correct
    @correct.to_f / @turns.count * 100.0
  end

  def percent_correct_by_category(category_arg)
    category_turns = 0
    @turns.each do |turn|
      if turn.card.category == category_arg
        category_turns += 1
      end
    end
    number_correct_by_category(category_arg) / category_turns.to_f * 100
  end

# Secret Refector for number_correct by category_arg by Chris
# def number_correct_by_category(category)
#   turns.count do |turn|
#     turn.correct? && category == turn.card.cateogry
#   end


end
