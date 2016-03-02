require_relative "driver"
require_relative "racktables_driver"

module ResourceIn
  class VMwareDriver < Driver
    CMD_BASE = "/usr/bin/python3 " + File.dirname(__FILE__) + '/driver/vmware/'
    def initialize
      @cmd_list = CMD_BASE + '/list_servers'
      @cmd_create = CMD_BASE + '/create'

      @cachepath = '/tmp/vmware_servers.cache'
    end
    def list_servers
      driver_racktables = RacktablesDriver.new

      invoke(@cmd_list, @cachepath).each do |d|
        d['status'] = d['status'] == 'green' ? 'ok' : 'warning'

        last_update = driver_racktables.get_lastupdate(d['name'])
        if !!last_update and last_update['status'] != 'error'
          d['created_by'] = "#{last_update['person']}"
        end
      end
    end
    def create(option)
    end
  end
end
