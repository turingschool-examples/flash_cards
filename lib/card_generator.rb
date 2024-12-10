# The CardGenerator class reads a text file and creates Card objects.
class CardGenerator
  attr_reader :filename, :cards

  # Initialize with the filename of the text file
  def initialize(filename)
    @filename = filename
    @cards = generate_cards
  end

  private

  # Reads the file and creates Card objects
  def generate_cards
    File.readlines(@filename).map do |line|
      question, answer, category = line.chomp.split(',')
      Card.new(question, answer, category.strip)
    end
  end
end
