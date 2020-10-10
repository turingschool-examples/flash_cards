class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    arr_of_lines = nil
    arr_of_cards_attr = []
    arr_of_cards = []
    File.open(@filename, 'r') do |file|
      arr_of_lines = file.readlines()
      # read by line instead of storing all lines into array
    end
    arr_of_lines = arr_of_lines.map do |line|
      line[0..-2]
      # can split here, use each
    end
    arr_of_lines.each do |line|
      arr_of_cards_attr << line.split(',')
      # create cards here after split
    end
    arr_of_cards_attr.each do |element|
      arr_of_cards << Card.new(element[0], element[1], element[2].to_sym)
    end
    arr_of_cards
  end

end
