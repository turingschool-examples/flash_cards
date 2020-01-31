class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    check_file(filename)
  end

  def check_file(filename)
    if(File.file?(filename))
      parse_file(filename)
    else
      parse_string(filename)
    end
  end

  def parse_file(filename)
    file = File.open(filename)
    file_data = file.readlines.map(&:chomp)
    file_data.each do | line |
      card_info = line.split(',')
      question = card_info[0]
      answer = card_info[1]
      category = card_info[2]
      @cards << Card.new(question, answer, category)
    end
  end

  def parse_string(string)
    file_data = string.      card_info = line.split(',')

    file_data.each do | line |
      question = card_info[0]
      answer = card_info[1]
      category = card_info[2]
      @cards << Card.new(question, answer, category)
    end

  end
end
