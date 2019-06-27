=begin
module Attack
  def attack(move)
  end
end

class Pokemon
  inlcude Attack
end

class Digimon
  include Attack
end

eevee = Pokemon.new
eevee.attack("tackle")
agumon = Digimon.new
agumon.attack("scratch")
=end
=begin
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
=end

class Card
attr_reader :question, :answer, :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def question
    puts "#{@question}"
  end

  def answer
    puts "#{@answer}"
  end

  def category
    puts "#{@category}"
  end
end

card = Card.new("What is element W", "Tungsten", :Science)
card.question
card.answer
card.category
