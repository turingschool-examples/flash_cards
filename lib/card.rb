class Card
  attr_reader :question, :answer, :category

  def initialize(question_arg, answer_arg, category_arg)
    @question = question_arg
    @answer = answer_arg
    @category = category_arg
  end

  def self.fabricate(question_arg, answer_arg, category_arg)
    if question_arg.class != String || answer_arg.class != String || category_arg.class != Symbol
      return 'Invalid Input'
    else
      self.new(question_arg, answer_arg, category_arg)
    end
  end


end
