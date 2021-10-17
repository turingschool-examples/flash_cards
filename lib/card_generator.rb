class CardGenerator
  attr_accessor :filename,
                :file

  def initialize(filename)
    @filename = 'cards.txt'
    @file = File.new(@filename)
  end

  def make_cards
    
  end
end
