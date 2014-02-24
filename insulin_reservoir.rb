class InsulinReservoir
  attr_reader :units

  def initialize(units = 300)
    @units = units
  end

  def has_enough?(units)
    @units >= units
  end

  def take(units)
    @units -= units
    units
  end
end
