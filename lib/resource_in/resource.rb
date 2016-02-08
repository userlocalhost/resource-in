module ResourceIn
  class Resource
    attr_reader :name, :type, :drivers

    def initialize
      @drivers = []
    end

    def show(condition)
      # get data with filtering
      data = filter(get_data, condition)

      # show filtered data
      show_table(Driver::FORMAT, data)
    end
  end
end
