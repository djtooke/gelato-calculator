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
  end

end
