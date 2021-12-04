require './lib/card'

class CardGenerator
  attr_reader :cards

  def initialize(cards_file)
    @cards_file = cards_file
    @cards = []
    create_cards
  end

  def create_cards
    File.open(@cards_file, 'r') do |file|
      file.readlines.each do |line|
        info = line.chomp.split(', ')
        # p Card.new(info[0], info[1], info[2].to_sym)
        @cards << Card.new(info[0], info[1], info[2].to_sym)
      end
    end
  end
end
