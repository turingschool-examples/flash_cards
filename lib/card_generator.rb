class CardGenerator

  attr_accessor :file, :cards_array

  def initialize(filename)
    @file = filename
    @cards_array = []
  end

  def cards
    pre_cards_array = []
    File.open(@file) do |handle|
      handle.each_line do |line|
        pre_cards_array << line.split(",")

      end
    end

    pre_cards_array.each do |card|
      add_to_deck_card = Card.new(card[0],card[1],card[2])
      @cards_array << add_to_deck_card
    end

    cards_array
  end
end
