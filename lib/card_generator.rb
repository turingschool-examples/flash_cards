class CardGenerator

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def text_content
    File.read("./lib/cards.txt").chomp
  end

end
