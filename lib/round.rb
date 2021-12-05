class Round
  attr_reader :deck, :curr_card, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @curr_card = 0
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[@curr_card]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    if turn.correct?
      @number_correct += 1
    end
    @turns << turn
    @curr_card += 1 unless current_card == @deck.cards[-1]
    return turn
  end

  def number_correct_by_category(cat)
    #cat_correct = 0
    @turns.count do |turn|
      turn.correct? && turn.card.category == cat
    end
  end

  def percent_correct_by_category(cat)
    x = @turns.count do |turn|
      turn.card.category == cat
    end
    (number_correct_by_category(cat).to_f / x * 100).round(1)
  end

  def percent_correct
    (@number_correct.to_f  / @turns.count * 100).round(1)
  end

  def overall_feedback
    if percent_correct == 100
      return "That's some GENIUS LEVEL SHIT!!!!!!!!!!"
    elsif percent_correct >= 50
      return "Generally, your brain is pretty good!"
    elsif percent_correct > 0
      return "Additional studies are recommended to improve your knowledge."
    elsif percent_correct == 0 ###Refactor to else
      return "Abysmal. Just ...wow."
    end
  end

  def category_feedback
    cat_fb = {}
    cats = []
    @turns.each do |turn|
      cats << turn.card.category
    end
    cats.uniq!
    cats.each do |cat|
      if percent_correct_by_category(cat) == 100
        cat_fb[cat] = "#{percent_correct_by_category(cat).round}% - GENIUS LEVEL SHIT"
      elsif percent_correct_by_category(cat) >= 50
        cat_fb[cat] = "#{percent_correct_by_category(cat).round}% - Pretty Good"
      elsif percent_correct_by_category(cat) > 0
        cat_fb[cat] = "#{percent_correct_by_category(cat).round}% - Needs Improvement"
      else
        cat_fb[cat] = "#{percent_correct_by_category(cat).round}% - Abysmal"
      end
    end
    return cat_fb
  end


end
