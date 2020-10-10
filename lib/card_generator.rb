require './lib/card'

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    File.open(filename).each do |line|
      question = line.split(",")[0]
      answer = line.split(",")[1].downcase
      category = line.split(",")[2].chomp
      @cards << Card.new(question, answer, category)
    end
  end

end
