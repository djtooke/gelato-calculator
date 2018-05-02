class Calculator

  attr_reader :gelato

  def initialize(gelato)
    raise "#{gelato} is not a Gelato object." unless gelato.class == Gelato
    @gelato = gelato
  end

end
