class Card

  attr_reader :quest, :answer, :category

  def initialize(quest, answer, category)
    @quest = quest
    @answer   = answer
    @category = category
  end

  def question
    puts "#{@quest}"
  end

  def answer
    puts "#{@answer}"
  end

  def category
    puts "#{@category}"
  end
end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card.question
card.answer
card.category
