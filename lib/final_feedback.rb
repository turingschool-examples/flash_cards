class FinalFeedback

  def initialize
  end

  def overall(round)
    if round.percent_correct == 100
      return "That's some GENIUS LEVEL SHIT!!!!!!!!!!"
    elsif round.percent_correct >= 50
      return "Overall, your brain is pretty good!"
    elsif round.percent_correct > 0
      return "Additional studies are recommended to improve your knowledge."
    elsif round.percent_correct == 0 ###Refactor to else
      return "Abysmal. Just ...wow."
    end
  end

  def categories(round)
    cat_fb = {}
    cats = []
    round.turns.each do |turn|
      cats << turn.card.category
    end
    cats.uniq!
    cats.each do |cat|
      if round.percent_correct_by_category(cat) == 100
        cat_fb[cat] = "#{round.percent_correct_by_category(cat).round}% - GENIUS LEVEL SHIT"
      elsif round.percent_correct_by_category(cat) >= 50
        cat_fb[cat] = "#{round.percent_correct_by_category(cat).round}% - Pretty Good"
      elsif round.percent_correct_by_category(cat) > 0
        cat_fb[cat] = "#{round.percent_correct_by_category(cat).round}% - Needs Improvement"
      else
        cat_fb[cat] = "#{round.percent_correct_by_category(cat).round}% - Abysmal"
      end
    end
    return cat_fb
  end



end
