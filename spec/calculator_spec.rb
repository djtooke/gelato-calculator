require 'calculator'

describe Calculator do

  let(:milk) { double :ingredient, constituent_percentages: {fat: 1.6, sugar: 0, lean_milk_solids: 9, other_solids: 0, water: 89.4} }
  let(:gorgonzola) { double :ingredient, constituent_percentages: {fat: 28, sugar: 0, lean_milk_solids: 20, other_solids: 2, water: 50} }
  let(:honey) { double :ingredient, constituent_percentages: {fat: 0, sugar: 80, lean_milk_solids: 0, other_solids: 0, water: 20} }
  let(:sucrose) { double :ingredient, constituent_percentages: {fat: 0, sugar: 100, lean_milk_solids: 0, other_solids: 0, water: 0} }
  let(:dextrose) { double :ingredient, constituent_percentages: {fat: 0, sugar: 92, lean_milk_solids: 0, other_solids: 0, water: 8} }
  let(:lmp) { double :ingredient, constituent_percentages: {fat: 0, sugar: 0, lean_milk_solids: 97, other_solids: 0, water: 3} }
  let(:stabilisers) { double :ingredient, constituent_percentages: {fat: 0, sugar: 0, lean_milk_solids: 0, other_solids: 100, water: 0} }
  let(:cream) { double :ingredient, constituent_percentages: {fat: 35, sugar: 0, lean_milk_solids: 6, other_solids: 0, water: 59} }

  let(:gorgonzola_and_honey) { double :gelato, class: Gelato, ingredients: {milk => 1000, gorgonzola => 280, honey => 100, sucrose => 190, dextrose => 50, lmp => 40, stabilisers => 4, cream => 220}}

  subject (:calc) {Calculator.new(gorgonzola_and_honey)}

  it 'should raise an error if initialized with a non-gelato object' do
    expect{Calculator.new("string")}.to raise_error('string is not a Gelato object.')
  end

  it 'should store the gelato argument as an instance variable' do
    expect(calc.gelato).to eq(gorgonzola_and_honey)
  end

  it 'should work out the total of the ingredient weights' do
    expect(calc.weight).to eq(1884)
  end

  it 'should calculate and store the percentages of each ingredient in a hash' do
    expect(calc.ingredient_percentages).to eq({
      milk => 53.1,
      gorgonzola => 14.9,
      honey => 5.3,
      sucrose => 10.1,
      dextrose => 2.7,
      lmp => 2.1,
      stabilisers => 0.2,
      cream => 11.7
      })
  end

  it 'should calculate and store the weights of the gelato\'s constituents' do
    expect(calc.constituent_grams).to eq({
      :fat => 171.4,
      :sugar => 316.0,
      :lean_milk_solids => 198.0,
      :other_solids => 9.6,
      :water => 1189.0
      })
  end

  it 'should calculate and store the total percentages of the constituents' do
    expect(calc.constituent_percentages).to eq({
      :fat => 9.1,
      :sugar => 16.8,
      :lean_milk_solids => 10.5,
      :other_solids => 0.5,
      :water => 63.1
      })
  end

  it 'should assess whether the constituent percentages are in the ideal ranges' do
    expect(calc.assessments).to eq({
      :fat => true,
      :sugar => true,
      :lean_milk_solids => true,
      :other_solids => true,
      :water => true
      })
  end

end
