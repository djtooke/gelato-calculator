require 'ingredient'

describe Ingredient do

  subject(:gorgonzola) {Ingredient.new(28, 0, 20, 2, 50)}

  it 'should have an accessible hash with its constituent percentages' do
    expect(gorgonzola.constituent_percentages).to be_a(Hash)
  end

  it 'should store given attributes within the percentage hash' do
    expect(gorgonzola.constituent_percentages[:fat]).to eq 28
    expect(gorgonzola.constituent_percentages[:sugar]).to eq 0
    expect(gorgonzola.constituent_percentages[:lean_milk_solids]).to eq 20
    expect(gorgonzola.constituent_percentages[:other_solids]).to eq 2
    expect(gorgonzola.constituent_percentages[:water]).to eq 50
  end

  it 'should raise an error if constituent percentages do not add up to 100%' do
    expect{Ingredient.new(50, 50, 50, 50, 50)}.to raise_error('Ingredient constituents do not add up to 100%')
  end

end
