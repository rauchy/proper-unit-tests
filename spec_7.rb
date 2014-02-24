require_relative './spec_helper'

describe InsulinPump do
  # example for state command test
  it "charges the battery" do
    pump = InsulinPump.new

    pump.charge_battery!

    expect(pump.battery_level).to eq(100)
  end
end
