require_relative './spec_helper'

describe InsulinPump do
  # example for state query test
  it "starts with an empty battery" do
    pump = InsulinPump.new

    battery_level = pump.battery_level

    expect(battery_level).to eq(0)
  end
end
