module ResourceIntegrator
  module MachineResourceImpl
    # all methods are private
    private

    def get_data
      @drivers.map do |klass|
        obj = klass.new

        obj.get_data
      end.flatten
    end
    def filter(data, condition)
      data.select do |d|
        cond = false
        cond |= d['name'] =~ /^#{condition}/
        cond |= d['address'] =~ /^#{condition}/
      end
    end
    def show_table(format, data)
      table_output = table do |t|
        t.headings = format
        data.each do |each|
          line = []
          format.each_with_index do |k, i|
            line[i] = each[k]
          end
          t << line
        end
      end
      puts table_output
    end
  end
end
