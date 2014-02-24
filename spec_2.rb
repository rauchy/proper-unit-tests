require_relative './spec_helper'

describe InsulinPump do
  it "raises an exception if there's not enough insulin in reservoir" do
    reservoir = InsulinReservoir.new(0)
    pump = InsulinPump.new(reservoir)

    action = -> { pump.act! }

    expect(action).to raise_error(NotEnoughInsulin)
  end
end
