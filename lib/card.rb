class Card

  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = process_card_input(answer)
    @category = category.to_sym
  end

  def process_card_input(str)
    str =~ /\d$/ ? (return str.to_i) : nil
    str.kind_of?(Numeric) ? (return str) : str
  end
end