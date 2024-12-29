require_relative 'card'

class CardGenerator
  def initialize(filename) #(filename = "cards.txt")
    @filename = filename #filename is an instance variable
  end

  def cards
    File.read(@filename).lines.map do |line|
      #File is a class, read is a class method. (@filename) is an instance variable. lines is an instance method. .map is an instance method. |line| is a block variable.
      question, answer, category = line.chomp.split('|')
      #question, answer, and category are all local variables. line is a block variable. chomp is a method that removes the newline character from the end of the string. split is a method that splits the string into an array of strings.
      Card.new(question, answer, category)
      #Card is a class. new is a class method. question, answer, and category are all local variables.
    end
  end
end