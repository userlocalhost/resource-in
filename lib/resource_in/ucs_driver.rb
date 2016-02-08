require_relative "driver"

module ResourceIn
  class UCSDriver < Driver
    def initialize
      @command = "/usr/bin/python2.7 " + File.dirname(__FILE__) + '/driver/ucs/get_servers'
      @cachepath = '/tmp/ucs_servers.cache'
    end
    def get_data
      super.each do |d|
        d['status'] = case d['status']
        when nil
          'ok'
        when 'ok'
          'ok'
        else
          'warning'
        end
        d['address'] = ''
      end
    end
  end
end
