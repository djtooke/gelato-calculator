require 'calculator'

describe Calculator do

  let(:gorgonzola_and_honey) { double :gelato}
  subject (:calc) {Calculator.new(gorgonzola_and_honey)}

  before(:example) do
    allow(gorgonzola_and_honey).to receive(:class).and_return(Gelato)
  end

  it 'should raise an error if initialized with a non-gelato object' do
    expect{Calculator.new("string")}.to raise_error('string is not a Gelato object.')
  end

  it 'should store the gelato argument as an instance variable' do
    expect(calc.gelato).to eq(gorgonzola_and_honey)
  end

end
