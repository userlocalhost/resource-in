module ResourceIntegrator
  class Resource
    attr_reader :name, :type

    def initialize
      @name = ''
      @type = ''
    end
  end
end
