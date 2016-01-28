require_relative "machine_impl"
require_relative "resource"

module ResourceIntegrator

  class Machine < Resource
    attr_reader :location, :manager

    def initialize(opts)
      super
      @name = opts[:name]
      @type = opts[:type]
      @location = opts[:location]
      @manager = opts[:manager]
    end

    include MachineResourceImpl
  end
end
