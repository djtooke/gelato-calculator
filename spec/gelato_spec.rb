require 'gelato'

describe Gelato do

  let(:gorgonzola) { double :ingredient}
  subject (:gorgonzola_and_honey) {Gelato.new()}

  it 'should have an accessible hash for ingredients' do
    expect(subject.ingredients).to be_a(Hash)
  end

end
