module Teamweek
  module Api
    module PathBuilder

      def set_base_uri(site, account_id)
        site ||= "https://teamweek.com"
        @base_uri = "#{site}/api/v3/#{account_id}/"
      end

      def full_path(entity, params)
        base_uri + relative_uri(entity, params)
      end

      private

      def relative_uri(entity, params)
        uri =  []
        uri << entity.resource_names
        uri << extract_param(:context, params) if params.has_key?(:context)
        uri =  uri.flatten
        insert_resource_ids(uri, params, entity.main_resource_name)
        uri.join('/')
      end

      def extract_param(name, params = {})
        if params.has_key?(name)
          extracted = params.fetch(name)
          params.delete(name)
          extracted
        end
      end

      def insert_resource_ids(uri, params, main_resource_name)
        id_related_params(params).each_key do |key|
          resource_name = extract_resource_name_from_id_param(key, main_resource_name)
          if uri.include?(resource_name)
            uri.insert(uri.index(resource_name) + 1, extract_param(key, params))
          end
        end
      end

      def id_related_params(params)
        params.select { |key, value| key.to_s =~ /.*id/ }
      end

      def extract_resource_name_from_id_param(id_param, main_resource_name)
        resource_name = id_param.to_s.gsub("_id", "")
        resource_name = main_resource_name if resource_name == "id"
        resource_name
      end
    end
  end
end
