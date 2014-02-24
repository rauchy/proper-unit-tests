require_relative './spec_helper'

describe InsulinPump do
  # example for interaction command test
  it "drips a single dose of insulin" do
    reservoir = stub(has_enough?: true, take: 5)
    infusion = mock('infusion')
    infusion.should_receive(:drip).with(5)

    pump = InsulinPump.new(reservoir, infusion)

    pump.act!(5)
  end
end
