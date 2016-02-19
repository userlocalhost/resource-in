module ResourceIn
  class Resource
    attr_reader :name, :type, :drivers

    def initialize
      @drivers = []
    end

    def show(condition)
      output(filter(condition, list))
    end

    def create(options)
      do_create(options)
    end

    ### These methods are assumed to be override by each Resource SubClass
    def list
      # This methods list data from each drivers
      # @output: Array
    end

    def filter(data, condition)
      # This implement filters of input data
      # @input:
      #   - data      : Array
      #   - condition : String
      # @output       : Array
    end

    def output(data)
      # This outputs data to STDOUT
      # @input  : Array
    end

    def do_create(options)
      # This create resoruce
    end
  end
end
