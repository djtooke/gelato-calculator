require 'gelato'

describe Gelato do

  let(:gorgonzola) { double :ingredient}
  subject (:gorgonzola_and_honey) {Gelato.new()}

  before(:example) do
    allow(gorgonzola).to receive(:class).and_return(Ingredient)
  end

  it 'should have an accessible hash for ingredients' do
    expect(subject.ingredients).to be_a(Hash)
  end

  describe 'add_ingredient' do

    it 'should add an ingredient and an integer to the ingredients hash' do
      subject.add_ingredient(gorgonzola, 280)
      expect(subject.ingredients).to include(gorgonzola => 280)
    end

    it 'should raise an error if weight is not an integer' do
      expect{ subject.add_ingredient(gorgonzola, 'string') }.to raise_error('Weight in grams must be an integer.')
    end

    it 'should raise an error if ingredient is not an ingredient object' do
      expect{ subject.add_ingredient('string', 280) }.to raise_error('Ingredient must be an ingredient object.')
    end

  end

  describe 'remove_ingredient' do

    it 'should remove an ingredient from the ingredients hash' do
      subject.add_ingredient(gorgonzola, 280)
      subject.remove_ingredient(gorgonzola)
      p subject
      expect(subject.ingredients).not_to include(gorgonzola)
    end

    it 'should raise an error if ingredient is not an ingredient object' do
      expect{ subject.remove_ingredient('string') }.to raise_error('Ingredient must be an ingredient object.')
    end

    it 'should raise an error if ingredient is not yet added to the gelato' do
      expect{ subject.remove_ingredient(gorgonzola) }.to raise_error('Ingredient has not been added to the gelato yet')
    end


  end

end
