class Card

  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = process_list_int(answer)
    @category = category.to_sym
  end

  def process_list_int(str)
    (str =~ /\d$/) ? (return str.to_i) : nil
    str.downcase
  end
end