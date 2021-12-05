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
        next if line == "\n"

        info = line.chomp.split(', ')
        @cards << Card.new(info[0], info[1], info[2].to_sym)
      end
    end
    @cards.shuffle!
  end
end
