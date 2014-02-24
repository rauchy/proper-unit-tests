require_relative './spec_helper'

describe InsulinReservoir do
  xit "raises an exception when there is not enough insulin" do
    reservoir = InsulinReservoir.new(100)

    action = -> { reservoir.take(500) }

    expect(action).to raise_error(NotEnoughInsulin)
  end
end
