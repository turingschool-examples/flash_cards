class CardGenerator

  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def cards
    handle = File.open(filename, "r")

    cards = handle.read

    handle.close

    card_list = cards.split("\n")
    card_list.map do |card|

      card = card.split(',')
      Card.new(card[0],card[1],card[2])
    end
  end
end
