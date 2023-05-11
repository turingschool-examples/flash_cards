require ./lib/card

class CardGenerator
    attr_reader :cards
  
    def initialize(filename)
      @cards = []
      File.readlines(filename).each do |line|
        question, answer, category = line.chomp.split(",")
        @cards << Card.new(question, answer, category)
      end
    end
end