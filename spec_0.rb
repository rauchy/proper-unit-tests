require_relative './spec_helper'

describe InsulinPump do
  it "takes insulin from the reservoir" do
    reservoir = InsulinReservoir.new(100)
    pump = InsulinPump.new(reservoir)

    pump.act!(10)

    expect(reservoir.units).to eq(90)
  end
end
