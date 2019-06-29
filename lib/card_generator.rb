
require 'pry'
class CardGenerator
  attr_reader :file, :split_lines

  def initialize(file)
    @file = File.open(file)
    @split_lines = []
    @base_cards = []
  end


  def extract_data
    @file.read.split(",").each do |item|
      if item

  end

  def assign_type
    @split_lines.map{|line| line.include("?")}
  end
end


filename = "./lib/cards.txt"
cards = CardGenerator.new(filename)

binding.pry
