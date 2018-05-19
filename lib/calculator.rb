class Calculator

  attr_reader :gelato, :scalar, :percentages

  def initialize(gelato)
    raise "#{gelato} is not a Gelato object." unless gelato.class == Gelato
    @gelato = gelato
    @scalar = scale.round(3)
    calculate_percentages
  end

  def calculate_percentages
  @percentages = {}
    @gelato.ingredients.each do |ingredient, weight|
      @percentages.store(ingredient, (weight.*(@scalar).round(1)))
    end
  end

private

  def scale
    total = 0
    @gelato.ingredients.each_value { |weight| total += weight }
    100.0 / total
  end

end
