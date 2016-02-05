require_relative "driver"

module ResourceIntegrator
  class VMwareDriver < Driver
    def initialize
      @command = "/usr/bin/python3 " + File.dirname(__FILE__) + '/driver/vmware/get_servers'
      @cachepath = '/tmp/vmware_servers.cache'
    end
    def get_data
      super.each do |d|
        d['status'] = d['status'] == 'green' ? 'ok' : 'warning'
      end
    end
  end
end
