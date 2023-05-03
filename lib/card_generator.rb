class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards
    File.foreach(@filename).map do |line|
      Card.new(line.split(",")[0].chomp,
               line.split(",")[1].chomp,
               line.split(",")[2].chomp)
    end
  end
end

class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer   = answer
    @category = category.to_sym
  end
end
