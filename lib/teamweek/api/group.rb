module Teamweek
  module Api
    class Group < Resource
      attr_accessor :id
      attr_accessor :foreign_id
      attr_accessor :name

      def to_hash
        {
          id: id,
          name: name,
          account_id: account_id
        }
      end
    end
  end
end
