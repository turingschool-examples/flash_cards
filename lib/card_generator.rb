class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards

    File.readlines(@filename).map do |row|
      question, answer, category = row.split(',')
      Card.new(question, answer, category.strip.to_sym)
    end
  end
end
