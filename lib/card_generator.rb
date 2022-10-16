class CardGenerator
attr_reader :cards

  def initialize(filename)
    @file = filename
    @array_of_cards = []
    @reformatted_array = []
    @cards = []

    open_file = File.open(@file)
    @array_of_cards =  open_file.readlines.map(&:chomp)
    @array_of_cards.each do |card|
      @reformatted_array << card.split(",")
    end

    @reformatted_array.each do |card|
      quest = card[0]
      answ = card[1]
      gues = card[2]
      new_card = Card.new(quest, answ, gues)
      @cards << new_card
    end
    @cards
  end
end
