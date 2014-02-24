require_relative './spec_helper'

describe InsulinPump do
  it "tells how many days are left until the next refill" do
    pump = InsulinPump.new
    pump.basal_dose = 30

    last_week { pump.act!(20) }
    yesterday { pump.act!(10) }
    today { pump.act!(30) }

    days_left = pump.days_until_next_refill

    expect(days_left).to eq(4)
  end












  it "calculates the daily usage" do
    pump = InsulinPump.new
    pump.basal_dose = 30

    last_week { pump.act!(20) }
    yesterday { pump.act!(10) }
    today { pump.act!(30) }

    daily_usage = pump.send(:daily_usage)

    expect(daily_usage).to eq(50)
  end
end
