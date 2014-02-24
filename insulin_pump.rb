require 'active_support/core_ext'
require_relative 'errors'
require_relative 'infusion'
require_relative 'insulin_reservoir'

class InsulinPump
  attr_reader :battery_level
  attr_writer :basal_dose

  def initialize(insulin_reservoir = InsulinReservoir.new,
                 infusion = Infusion.new)
    @insulin_reservoir = insulin_reservoir
    @infusion = infusion
    @battery_level = 0
    @usage = {}
  end

  def act!(units = 1)
    if @insulin_reservoir.has_enough?(units)
      insulin = @insulin_reservoir.take(units)
      @infusion.drip(insulin)
      track(units)
    else
      raise NotEnoughInsulin
    end
  end

  def set_basal_schedule
    stop_previous_basal_drips
    start_dripping_basal
  end

  def charge_battery!
    @battery_level = 100
  end

  def days_until_next_refill
    @insulin_reservoir.units / daily_usage
  end

  private

  def start_dripping_basal
    if @basal_dose > 0
      @basal_thread = Thread.new do
        while true
          drip_hourly_basal_dose
        end
      end
    end
  end

  def stop_previous_basal_drips
    @basal_thread.try(:kill)
  end

  def drip_hourly_basal_dose
    act!(basal_dose_per_hour)
    sleep 1.second
  end

  def basal_dose_per_hour
    @basal_dose / 24.0
  end

  def track(units)
    @usage[Date.today] ||= 0
    @usage[Date.today] += units
  end

  def daily_usage
    @usage.values.sum / @usage.keys.count + @basal_dose
  end
end

class Usage ; end

i = Infusion.new
ir = InsulinReservoir.new
mu = InsulinPump.new(ir, i)

mu.act!
#binding.pry
