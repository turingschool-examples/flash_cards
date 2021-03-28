class CardGenerator

  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def collect
    cards = File.open(@filename, 'r') do |file|
      file.readlines.map(&:chomp)
    end
  end

end
