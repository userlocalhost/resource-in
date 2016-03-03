require_relative "driver"
require 'rbconfig'

module ResourceIn
  class RacktablesDriver < Driver
    def initialize
      @cmd_lastupdate = 'get_vm_lastupdate'
      @cachepath = '/tmp/cache.racktables'
    end
    def get_lastupdate(vm)
      invoke("#{@cmd_lastupdate} '#{vm}'", @cachepath + ".last_update.#{vm}")
    end
  end
end
