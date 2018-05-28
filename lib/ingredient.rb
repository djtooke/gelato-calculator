class Ingredient

  attr_reader :constituent_percentages

  def initialize(fat, sugar, lean_milk_solids, other_solids, water)
    raise 'Ingredient constituents do not add up to 100%' unless (fat + sugar + lean_milk_solids + other_solids + water == 100)
    @constituent_percentages = {
      fat: fat,
      sugar: sugar,
      lean_milk_solids: lean_milk_solids,
      other_solids: other_solids,
      water: water
    }
    end

end
