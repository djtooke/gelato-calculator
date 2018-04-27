require 'ingredient'

describe Ingredient do
  it 'should have accessible attributes for fat, sugar, lean_milk_solids, other_solids and water'
  gorgonzola = Ingredient.new(28, 0, 20, 2, 50)
  expect(subject).to respond_to (:fat)
  expect(subject).to respond_to (:sugar)
  expect(subject).to respond_to (:lean_milk_solids)
  expect(subject).to respond_to (:other_solids)
  expect(subject).to respond_to (:water)
end
