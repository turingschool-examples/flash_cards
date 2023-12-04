class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def card_data
    File.readlines(@filename, chomp: true)
  end

  def card

  end

end
