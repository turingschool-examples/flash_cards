# frozen_string_literal: true

# Defines a flashcard with a question, answer, and category.
class Card
  attr_reader :category, :question, :answers

  def initialize(category, question, *answers)
    @category = category
    @question = question
    @answers = answers.flatten.map(&:downcase)
  end
end
