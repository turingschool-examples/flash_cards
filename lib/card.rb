class Card

  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = process_answer(answer)
    @category = category.to_sym
  end

  def process_answer(str)
    str =~ /\d$/ ? (return str.to_i) : nil
    str.is_a?(Numeric) ? (return str) : nil
    str.downcase
  end
end