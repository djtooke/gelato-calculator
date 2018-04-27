require 'ingredient'

describe Ingredient do
  it 'should have an accessible hash with its constituent percentages' do
    gorgonzola = Ingredient.new(28, 0, 20, 2, 50)
    expect(gorgonzola).to respond_to (:percentage)
  end
end
