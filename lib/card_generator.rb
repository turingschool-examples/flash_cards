class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file.map { |line|
      question, answer, category = line.split(",")
      category = category.strip.to_sym
      Card.new(question, answer, category)
    }
  end

  def file
    File.open("./lib/#{filename}", "r")
  end
end
