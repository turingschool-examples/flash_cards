class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    list_of_cards = File.foreach(@filename).map do |line|
      line.split(", ")
    end.flatten
    
    split_cards = list_of_cards.map do |card|
      card.split(",")
    end
    
    split_cards.pop

    made_cards = []

    split_cards.each do |card|
      question = card[0]
      answer = card[1]
      category = card[2].chomp.gsub(" ", "_").to_sym
      made_cards << Card.new(question, answer, category)
    end
    made_cards
  end

end