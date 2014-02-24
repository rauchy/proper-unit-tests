require 'rspec'
require 'pry'
require_relative './insulin_pump'

def last_week
  Date.stub(today: 1.week.ago.to_date)
  yield
  Date.unstub(:today)
end

def yesterday
  Date.stub(today: 1.day.ago.to_date)
  yield
  Date.unstub(:today)
end

def today
  yield
end
