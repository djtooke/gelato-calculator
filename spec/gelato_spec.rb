require 'gelato'

describe Gelato do

  let(:gorgonzola) { double :ingredient}
  subject (:gorgonzola_and_honey) {Gelato.new()}

  it 'should have an accessible hash for ingredients' do
    expect(subject.ingredients).to be_a(Hash)
  end

  describe 'add_ingredient' do
    it 'should add an ingredient and an integer to the ingredients hash' do
      subject.add_ingredient(gorgonzola, 280)
      expect(subject.ingredients).to eq({gorgonzola => 280})
    end

    it 'should raise an error if anything than an integer is given for the weight' do
      expect{ subject.add_ingredient(gorgonzola, 'string') }.to raise_error('Weight in grams must be an integer.')
    end
  end



end
