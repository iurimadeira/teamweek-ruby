module Teamweek
  module Api
    class Resource
      include Teamweek::Api::HashConstructed

      def self.resource_names
        resource_name = self.name.split('::').last
        resource_name = resource_name.gsub(/([^\^])([A-Z])/,'\1_\2')
        resource_name.downcase.split('_').map { |resource| resource + 's' }
      end

      def self.main_resource_name
        self.name.split('::').last.downcase + 's'
      end
    end
  end
end
