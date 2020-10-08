class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def open_file
    card_file = File.open(filename)
    card_file.split("\n")
  end

end