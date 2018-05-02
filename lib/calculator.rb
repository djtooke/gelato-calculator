class Calculator

  attr_reader :gelato, :scalar

  def initialize(gelato)
    raise "#{gelato} is not a Gelato object." unless gelato.class == Gelato
    @gelato = gelato
    @scalar = scale.round(3)
  end

private

  def scale
    total = 0
    @gelato.ingredients.each_value { |weight| total += weight }
    100.0 / total
  end

end
