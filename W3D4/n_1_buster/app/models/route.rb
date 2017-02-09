class Route < ActiveRecord::Base
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    buses = self.buses.includes(:drivers)

    result = {}
    buses.each do |bus|
      driver_names = []
      bus.drivers.each do |driver|
        driver_names << driver.name
      end
      result[bus.id] = driver_names
    end
    result
  end
end
