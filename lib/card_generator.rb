class CardGenerator
  def initialize(filename = "cards.txt")
    @filename = filename
  end

  def cards_from_file
    first_array = File.readlines(@filename).map do |line|
      line.chomp.split(",")
    end
    card_array = first_array.map do |array|
      Card.new(array[0], array[1], array[2])
    end
  end
end
