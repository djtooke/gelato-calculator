require 'calculator'

describe Calculator do

  let(:gorgonzola_and_honey) { double :gelato}

  it 'should raise an error if initialized without a gelato object' do
    expect{Calculator.new("string")}.to raise_error('string is not a Gelato object.')
  end

end
