class Round

  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, deck.cards.first)
    @turns << turn
    deck.cards.rotate!
    return turn
  end

  def correct?
    if round.turns.first.string == round.turns.fist.card.answer
      return true
    else
      return false
    end
  end

  def number_correct
    num_correct = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          turn_index += 1
        else
          turn_index += 1
        end
      end
    end
    num_correct
  end

  def number_correct_by_category(category)
    num_correct = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].card.category == category && @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          turn_index += 1
        else
          turn_index += 1
        end
      end
    end
    num_correct
  end

  def percent_correct
    num_correct = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          turn_index += 1
        else
          turn_index += 1
        end
      end
    end
    num_correct / @turns.count.to_f * 100
  end

  def percent_correct_by_category(category)
    num_correct = 0
    category_count = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].card.category == category && @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          category_count += 1
          turn_index += 1
        else
          turn_index += 1
        end
      end
    end
    num_correct / category_count.to_f * 100
  end
end
