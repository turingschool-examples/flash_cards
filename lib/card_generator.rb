class CardGenerator
    attr_reader :file

  def initialize(file)
    @file = file
  end

  def cards(file)
    File.new(@file).readlines
    p cards
  end 
end
