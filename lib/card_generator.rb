class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    lines = []
    File.readlines(@filename).each do |line|
      lines << [line.chomp]
    end
    lines

    split_lines = []
    lines.each do |line|
      split_lines << line.join.split(',')
    end
    split_lines

    question = nil
    answer = nil
    category = nil
    cards = split_lines.map do |element|
      question = element[0]
      answer = element[1]
      if element[2] == "STEM" || element[2] == "Geography"
        category = element[2].to_sym
      else
        category = element[2]
      end
      card = Card.new(question, answer, category)
    end
    cards
  end

end
