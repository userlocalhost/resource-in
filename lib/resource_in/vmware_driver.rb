require_relative "driver"

module ResourceIn
  class VMwareDriver < Driver
    CMD_BASE = "/usr/bin/python3 " + File.dirname(__FILE__) + '/driver/vmware/'
    def initialize
      @cmd_list = CMD_BASE + '/list_servers'
      @cmd_create = CMD_BASE + '/create'

      @cachepath = '/tmp/vmware_servers.cache'
    end
    def list_servers
      invoke(@cmd_list, @cachepath).each do |d|
        d['status'] = d['status'] == 'green' ? 'ok' : 'warning'
      end
    end
    def create(option)
    end
  end
end
