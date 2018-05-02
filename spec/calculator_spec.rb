require 'calculator'

describe Calculator do

  let(:gorgonzola_and_honey) { double :gelato}
  subject (:calc) {Calculator.new(gorgonzola_and_honey)}

  # May need to create mock ingredient objects and work out how to put them as the hash keys
  before(:example) do
    allow(gorgonzola_and_honey).to receive(:class).and_return(Gelato)
    allow(gorgonzola_and_honey).to receive(:ingredients).and_return({
       :milk => 1000,
       :gorgonzola => 280,
       :honey => 100,
       :sucrose => 190,
       :dextrose =>50,
       :lmp => 40,
       :stabilisers => 4,
       :cream => 220
     })
  end

  it 'should raise an error if initialized with a non-gelato object' do
    expect{Calculator.new("string")}.to raise_error('string is not a Gelato object.')
  end

  it 'should store the gelato argument as an instance variable' do
    expect(calc.gelato).to eq(gorgonzola_and_honey)
  end

  it 'should work out the scalar of the ingredient weights' do
    expect(calc.scalar).to eq(0.053)
  end

end
