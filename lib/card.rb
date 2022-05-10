class Card

  attr_reader :question,:answer,:subject

  def initialize(question,answer,subject)
    @question = question
    @answer = answer
    @subject = subject
  end


end
