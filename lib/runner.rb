class Runner
  def card_1
    @card_1
  end

  def question
    @question = "What is 5+5?"
  end

  def answer
    @card_1_answer = 10
  end

  def feedback_correct
    @feedback_correct = "Correct!" == @card_1_answer
  end

  def feedback_incorrect
    @feedback_incorrect = "Incorrect."
  end
end
