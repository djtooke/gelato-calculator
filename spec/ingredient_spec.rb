require 'ingredient'

describe Ingredient do

  subject(:gorgonzola) {Ingredient.new(28, 0, 20, 2, 50)}

  it 'should have an accessible hash with its constituent percentages' do
    expect(gorgonzola).to respond_to (:percentage)
  end

  it 'should store given attributes within the percentage hash' do
    expect(gorgonzola.percentage[:fat]).to eq 28
    expect(gorgonzola.percentage[:sugar]).to eq 0
    expect(gorgonzola.percentage[:lean_milk_solids]).to eq 20
    expect(gorgonzola.percentage[:other_solids]).to eq 2
    expect(gorgonzola.percentage[:water]).to eq 50
  end
end
