class CardGenerator

  def initialize(filename)
    @filename = File.open("cards.txt", "r")
    @incoming_text = @filename.read
  end

  def cards
    hold = File.foreach("cards.txt").map do |line|
      line.split(", ")
    end.flatten
    
    hold_2 = hold.map do |card|
      card.split(",")
    end
    
    hold_2.pop

    hold_3 = []

    hold_2.each do |card|
      question = card[0]
      answer = card[1]
      category = card[2].chomp.gsub(" ", "_").to_sym
      hold_3 << Card.new(question, answer, category)
    end
    hold_3
    # require 'pry'; binding.pry
  end

end