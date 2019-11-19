class Card
  attr_reader :query, :answer, :topic

  def initialize(query, answer, topic)
    @query = query
    @answer = answer
    @topic = topic
  end

  def question
    p "#{@query}"
  end

  def answer
    p "#{@answer}"
  end

  def category
    p @topic
  end

end
