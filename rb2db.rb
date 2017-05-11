#!/usr/bin/ruby
require 'duffy'
require 'influxdb'

# CONFIG #
# InfluxDB Server:
influx_host = ENV['INFLUX_HOST'] || "localhost"

# Local Hostname
influx_db = ENV['INFLUX_DB'] || `hostname`.strip

# Create Database for this host if it doesn't already exist
InfluxDB::Client.new(host: influx_host).create_database(influx_db)

# Connect to InfluxDB with database for this hostname selected
influxdb = InfluxDB::Client.new(influx_db, host: influx_host)

puts "Logging Started: #{influx_db} => #{influx_host}"
Process.daemon

while sleep 1
  influxdb.write_points([
                          { series: 'cpu_percent',   values: { value: Duffy::System.cpu_percent } },
                          { series: 'mem_total',     values: { value: Duffy::System.mem_total } },
                          { series: 'mem_used',      values: { value: Duffy::System.mem_used } },
                          { series: 'mem_available', values: { value: Duffy::System.mem_available } }
                        ])
end

