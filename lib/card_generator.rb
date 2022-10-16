class CardGenerator

  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename

    @cards = [ ]
    cards_text = File.read("cards.txt").split("\n")

    cards_text.each do |line|
      cur_card = line.split(",")
      question = cur_card[0]
      answer = cur_card[1]
      category = cur_card[2].to_sym
      @cards << Card.new(question,answer,category)
    end
  end
end
