class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def cards
    file = File.open(filename, "r")
    file.read(filename, ',')
    incoming_flashcards = file.read

    p incoming_flashcards
  end

end
