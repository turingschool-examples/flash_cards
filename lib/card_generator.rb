# Couldn't quite get this one!!

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file = File.open(filename, "r")
    line = file.read(filename, ',')
    p "DEBUG: line #{line}"
    incoming_flashcards = []

    # file.read

    p "DEBUG: #{incoming_flashcards}"

    file.close
  end

end
