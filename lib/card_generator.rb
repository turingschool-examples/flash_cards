require './lib/card.rb'

class CardGenerator

  def initialize(filename)
    @file = File.open(filename)
  end

  def cards
    file_data = @file.readlines.map(&:chomp)
    cards = []
    file_data.each do |card|
      card_arr = card.split(",")
      card_arr[2] = card_arr[2].to_sym
      cards << card_arr
    end

    cards.map do |generate|
      Card.new(generate[0], generate[1], generate[2])
    end
  end
end
