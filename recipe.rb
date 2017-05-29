class Recipe
  attr_accessor :name, :ingredients

  def initialize name, &block
    self.name = name
    self.ingredients = []

    instance_exec(&block)
  end

  def ingredient name, qty
    ingredients << Ingredient.new(name, qty)
  end
end

Ingredient = Struct.new(:name, :qty)

def recipe name, &block
  Recipe.new(name, &block)
end


r = recipe "chocolate cake" do
  ingredient "sugar", "1 pound"
  ingredient "chocolate", "200 gr"
end

require "pry"
binding.pry
