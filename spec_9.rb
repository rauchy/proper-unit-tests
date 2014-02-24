require_relative './spec_helper'

describe InsulinPump do
  # example for an UNNEEDED interaction query test
  it "checks that there is enough insulin before dripping" do
    reservoir = mock(take: 5)
    reservoir.should_receive(:has_enough?).with(5).and_return(true)
    infusion = stub(drip: 5)

    pump = InsulinPump.new(reservoir, infusion)

    pump.act!(5)
  end

  # should I drop it?
  it "drips a single dose of insulin" do
    reservoir = stub(has_enough?: true, take: 5)
    infusion = mock('infusion', drip: 5)
    pump = InsulinPump.new(reservoir, infusion)

    pump.act!(5)

    expect(infusion).to have_received(:drip).with(5)
  end
end
