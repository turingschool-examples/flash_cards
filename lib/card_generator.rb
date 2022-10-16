class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def open_file
    file = File.new()
  end
end
