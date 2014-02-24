require_relative './spec_helper'

describe Usage do
  xit "calculates the daily usage" do
    usage = Usage.new(basal: 34)

    usage.track last_week: 10,
                yesterday: 12,
                today:     14

    expect(usage.daily_average).to eq(46)
  end
end
