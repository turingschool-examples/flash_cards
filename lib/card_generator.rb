require 'pry'
class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def make_card
    File.open(@filename).each do |line|
      new_card = line.chomp.split(",")
      question = new_card[0]
      answer = new_card[1]
      category = new_card[2].to_sym
      card = Card.new(question, answer, category)
      @cards << card
    end
  end
end
