class CardGenerator
    attr_reader :text
  def initialize(filename)
    # require 'pry'; binding.pry
    @text = File.read(filename)
    # def cards(text.split(','))
    #     require 'pry'; binding.pry
    # end
    # require 'pry'; binding.pry

  end

  def cards
    # (@text.split(',').card)
    #     @question = question
    #     @answer = answer
    #     @category = category

    # end

    Card.new(text.split(',')[0],text.split(',')[1],text.split(',')[2])
  end
end
