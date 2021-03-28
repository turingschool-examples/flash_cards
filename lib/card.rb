class Card
  attr_accessor :question,
                :answer,
                :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end


# def number_correct_by_category(category)
#   @turns.count do |turn|
#     turn.card.category == category && turn.correct?
#   end
# end
#
# def percent_correct
#   number_correct.to_f / @turns.count.to_f * 100
# end
#
# def total_cards_in_category(category)
#   @deck.cards.count do |card|
#     card.category == category
#   end
# end
#
# def percent_correct_by_category(category)
#   number_correct_by_category(category).to_f / total_cards_in_category(category).to_f * 100
# end
