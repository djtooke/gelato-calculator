require 'ingredient'

describe Ingredient do

  subject(:gorgonzola) {Ingredient.new(28, 0, 20, 2, 50)}

  it 'should have an accessible hash with its constituent percentages' do
    expect(gorgonzola).to respond_to (:percentage)
  end

end
