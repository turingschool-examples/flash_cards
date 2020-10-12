class Card
  attr_reader :question, :answer, :category, :total_cards
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
    @total_cards = 0
  end
# require "pry"; binding.pry
  # def total_card_count
  #   if Card.initialize
  #     @total_cards += 1
  #   end
  # end
end
