class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  cards = []
  cards_text = File.read("cards.txt")
  cards_text = cards_text.split("\n")

  cards_text.each do |line|
    cur_card = line.split(",")
    cards << Card.new(cur_card[0], cur_card[1], cur_card[2].to_sym)
  end


end
