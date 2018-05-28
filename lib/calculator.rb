class Calculator

  attr_reader :gelato, :weight, :ingredient_percentages, :constituent_grams, :constituent_percentages, :assessments

  CONSTITUENTS = [:fat, :sugar, :lean_milk_solids, :other_solids, :water]
  IDEAL_CONSTITUENT_RANGES = {fat: 6...12, sugar: 16...22, lean_milk_solids: 8...12, other_solids: 0...100, water: 58...68}

  def initialize(gelato)
    raise "#{gelato} is not a Gelato object." unless gelato.class == Gelato
    @gelato = gelato
    @weight = weigh
    @ingredient_percentages = {} #(Re)created in calculate_ingredient_percentages
    @constituent_grams = {} #(Re)created in calculate_constituent_grams
    @constituent_percentages = {} #(Re)created in calculate_constituent_percentages
    @assessments = {} #(Re)created in check_percentages
    evaluate
    puts @assessments
  end

  def calculate(gelato = @gelato)
    initialize(gelato)
  end

private

  def evaluate
    calculate_ingredient_percentages
    calculate_constituent_grams
    calculate_constituent_percentages
    compare_percentages
  end

  def weigh
    total = 0
    @gelato.ingredients.each_value { |weight| total += weight }
    total
  end

  def calculate_ingredient_percentages
    @ingredient_percentages = {}
    @gelato.ingredients.each do |ingredient, grams|
      @ingredient_percentages.store(ingredient, (grams.*(100.0/@weight).round(1)))
    end
  end

  def calculate_constituent_grams
    @constituent_grams = {}
    CONSTITUENTS.each do |constituent|
       total = 0
       @gelato.ingredients.each do |ingredient, grams|
         total += (ingredient.constituent_percentages[constituent].*(0.01)).*(grams)
       end
       @constituent_grams.store(constituent, total.round(1))
    end
  end

  def calculate_constituent_percentages
    @constituent_percentages = {}
    @constituent_grams.each do |constituent, grams|
      constituent_percentages.store(constituent, (grams./@weight).*(100).round(1))
    end
  end

  def compare_percentages
    @assessments = {}
    @constituent_percentages.each do |constituent, percentage|
      assessment = IDEAL_CONSTITUENT_RANGES[constituent] === percentage ? true : false
      assessments.store(constituent, assessment)
    end
  end

end
