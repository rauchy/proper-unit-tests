require_relative './spec_helper'

describe InsulinReservoir do
  it "takes insulin" do
    reservoir = InsulinReservoir.new(100)

    reservoir.take(10)

    expect(reservoir.units).to eq(90)
  end
end
