require_relative 'ucs_driver'
require_relative 'vmware_driver'

require 'terminal-table/import'

module ResourceIntegrator
  class Command
    LIST = 'list'

    def self.list(opts, condition)
      resource_kls = case opts[:type]
      when 'all'
        Machine
      when 'machine'
        Machine
      else
        raise 'unknown type is detected'
      end

      resource = resource_kls.new

      resource.show(condition)
    end
  end
end
