module Teamweek
  module Api
    module Importer

      def bulk_import(data, context)
        response = bulk_post(context, data)
        response.map { |h| context.new(h) }
      end

      def bulk_post(context, data)
        client.post(bulk_uri(context), { context.main_resource_name => data })
      end

      def bulk_uri(context)
        full_path(context, {context:'bulk_import.json'})
      end

    end
  end
end
