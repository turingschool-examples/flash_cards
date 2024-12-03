# frozen_string_literal: true

# Defines a flashcard with a question on one side and an answer on the other.
class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
