require 'json'

module ResourceIn
  class Driver
    FORMAT = ['name', 'address', 'status', 'location', 'boottime', 'created_by']

    def invoke(command, cachepath = '/dev/null')
      if !!cachepath and FileTest.exists?(cachepath) and not FileTest.zero?(cachepath)
        JSON.parse(File.read(cachepath))
      else
        JSON.parse(`#{command} 2> /dev/null | tee #{cachepath}`)
      end
    end
  end
end
