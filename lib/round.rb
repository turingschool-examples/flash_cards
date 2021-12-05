class Round
  attr_reader :deck, :turns, :number_correct, :correct_turn, :number_wrong, :round_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0
    @current_card = deck.cards[0]
    @number_correct = 0
    @incorrect_turn = []
    @correct_turn = []
    @number_wrong = 0
    
  end

  def round_count
    @round_count = @count +=1
  end

  def current_card
    @current_card = deck.cards[@count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @number_correct += 1
      @correct_turn << turn
    else
      @number_wrong += 1
    end
    @count += 1
    @turns.last
  end

  def number_correct_by_category(category)
    my_correct_categories = 0
    @correct_turn.each do |look|
      if look.card.category == category
        my_correct_categories += 1
      end
    end
    my_correct_categories
  end

  def percent_correct
    percent = @number_correct.to_f / @count.to_f
    percent = percent * 100
    percent
  end

  def percent_correct_by_category(category)
    percent_correct_by_category = turns.count do |per_turn| category == per_turn.card.category && per_turn.guess == per_turn.card.answer
    end
    category_math_var = turns.count do |per_turn| category == per_turn.card.category
    end
    (percent_correct_by_category.to_f / category_math_var.to_f) * 100
  end



end
