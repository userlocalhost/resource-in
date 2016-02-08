require_relative "machine_impl"
require_relative "resource"

module ResourceIntegrator

  class Machine < Resource
    attr_reader :location, :manager

    def initialize
      super
      @drivers = [UCSDriver, VMwareDriver]
    end

    include MachineResourceImpl
  end
end
