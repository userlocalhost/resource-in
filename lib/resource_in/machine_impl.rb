module ResourceIn
  module MachineResourceImpl
    def list
      @drivers.map do |klass|
        obj = klass.new

        obj.get_data
      end.flatten
    end
    def filter(condition, data)
      data.select do |d|
        cond = false
        cond |= d['name'] =~ /^#{condition}/
        cond |= d['address'] =~ /^#{condition}/
      end
    end
    def output(data)
      format = Driver::FORMAT

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
    def do_create(options)
      @drivers.each do |klass|
        obj = klass.new

        obj.create(options)
      end
    end
  end
end
