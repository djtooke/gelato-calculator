require 'ingredient'

describe Ingredient do

  subject(:gorgonzola) {Ingredient.new(28, 0, 20, 2, 50)}

  it 'should have an accessible hash with its constituent percentages' do
    expect(gorgonzola).to respond_to (:percentage)
  end

  it 'should have stored attributes for fat, sugar, lean_milk_solids, other_solids and water' do
    expect(gorgonzola.percentage[:fat]).to eq 28
  end
end
