require 'json'

module ResourceIn
  class Driver
    FORMAT = ['name', 'address', 'status', 'location', 'type', 'manager']

    def get_data
      if !!@cachepath and FileTest.exists?(@cachepath)
        JSON.parse(File.read(@cachepath))
      else
        system("#{@command} 1> #{@cachepath} 2> /dev/null")
        get_data
      end
    end
    def create
      # This methods implemented on each driver
    end
  end
end
