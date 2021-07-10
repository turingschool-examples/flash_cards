require_relative 'play_game'

class CardGenerator

  attr_reader :card_text,
              :cards

  def initialize(file)
    @file = File.new(file, "r")
    @cards = create_cards
  end

  def create_cards
    single_cards = @file.read.split("\n")
    single_cards.map do |card_data|
      card_split = card_data.split(",")

      Card.new(card_split[0], card_split[1], card_split[2].to_sym)
      # Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    end



  end

end
