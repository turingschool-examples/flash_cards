class CardGenerator
  def initialize(filename = "cards.txt")
    @filename = filename
  end

  def cards_from_file
    first_array = File.readlines(@filename).map do |line|
      line.split(",")
    end
    second_array = first_array.flatten
    third_array = second_array.map do |element|
      if element.include?("\n")
        element.chomp
      else
        element
      end
    end
    fourth_array = third_array.each_slice(3).to_a
    card_array = fourth_array.map do |array|
      Card.new(array[0], array[1], array[2])
    end
  end
end
