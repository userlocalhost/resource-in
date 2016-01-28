require_relative 'ucs_driver'
require_relative 'vmware_driver'

require 'terminal-table/import'

module ResourceIntegrator
  class Command
    LIST = 'list'

    def self.list(opts, condition)
      drivers = []
      case opts[:type]
      when 'all'
        drivers = [UCSDriver, VMwareDriver]
      when 'virtual'
        drivers = [VMwareDriver]
      when 'physical'
        drivers = [UCSDriver]
      else
        raise 'unknown type is detected'
      end

      # get data from driver
      data = get_data(drivers)

      # filter data
      data = filter(data, condition)

      # show result
      show_table(Driver::FORMAT, data)
    end

    private
    def self.get_data(drivers)
      data = []

      drivers.each do |klass|
        obj = klass.new
        data += obj.get_data
      end
      data
    end
    def self.show_table(format, data)
      table_output = table do |t|
        t.headings = format
        data.each do |each|
          line = []
          format.each_with_index do |k, i|
            line[i] = each[k]
          end
          t << line
        end
      end
      puts table_output
    end
    def self.filter(data, condition)
      data.select do |d|
        cond = false
        cond |= d['name'] =~ /^#{condition}/
        cond |= d['address'] =~ /^#{condition}/
      end
    end
  end
end
