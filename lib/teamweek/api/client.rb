module Teamweek
  module Api
    class Client
      include Teamweek::Api::Importer
      include Teamweek::Api::PathBuilder
      attr_accessor :client
      attr_accessor :base_uri

      def initialize(client, account_id, opts={})
        @client = client
        set_base_uri(opts[:base_uri], account_id)
      end

      # Posts users to Teamweek bulk_import url.
      #
      # @param users: an array of users data as hash.
      # @return [Teamweek::Api::User] the added or found Teamweek user instances
      def import_users(data)
        bulk_import(data, Teamweek::Api::User)
      end

      # Posts projects to Teamweek bulk_import url.
      #
      # @param projects: an array of projects data as hash.
      # @return [Teamweek::Api::Project] the added or found Teamweek project instances
      def import_projects(data)
        bulk_import(data, Teamweek::Api::Project)
      end

      # Posts tasks to Teamweek bulk_import url.
      #
      # @param tasks: an array of tasks data as hash.
      # @return [Teamweek::Api::Task] the added or found Teamweek task instances
      def import_tasks(data)
        bulk_import(data, Teamweek::Api::Task)
      end

      def fetch(entity, params = {})
        resources = client.get(full_path(entity, params), params)
        map_resources(entity, resources)
      end

      def update(entity, objects = {})
        resources = client.put(full_path(entity, objects), objects)
        map_resources(entity, resources)
      end

      def create(entity, objects = {})
        resources = client.post(full_path(entity, objects), objects)
        map_resources(entity, resources)
      end

      def delete(entity, objects = {})
        client.delete(full_path(entity, objects), objects)
      end

      private

      def map_resources(entity, resources)
        resources = [resources] unless resources.is_a?(Array)
        resources.map { |resource| entity.new(resource) }
      end
    end
  end
end
