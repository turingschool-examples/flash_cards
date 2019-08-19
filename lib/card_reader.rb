require './lib/card'
class CardReader
  attr_reader :card_bank

  def initialize
    @card_bank = []
  end

  def read_cards(file_location)
    current_line = 0
    card_bank = @card_bank
    File.open(file_location).each do |line|
      card_array = line.split(",")
      card_bank[current_line] = Card.new(card_array[0], card_array[1], card_array[2].chomp)
      current_line += 1
    end
    @card_bank = card_bank
  end
end
