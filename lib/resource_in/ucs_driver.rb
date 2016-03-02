require_relative "driver"

module ResourceIn
  class UCSDriver < Driver
    def initialize
      @cmd_list = "/usr/bin/python2.7 " + File.dirname(__FILE__) + '/driver/ucs/list_servers'
      @cachepath = '/tmp/ucs_servers.cache'
    end
    def list_servers
      invoke(@cmd_list, @cachepath).each do |d|
        d['status'] = case d['status']
        when 'ok'
          'ok'
        else
          'warning'
        end
        d['address'] = []
        d['boottime'] = ''
        d['created_by'] = ''
      end
    end
  end
end
