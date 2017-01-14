module Teamweek
  module Api
    class GroupMembership < Resource
      attr_accessor :id
      attr_accessor :foreign_id
      attr_accessor :name
      attr_accessor :group_id
      attr_accessor :user_id
      attr_accessor :position
      attr_accessor :weight

      def to_hash
        {
          id: id,
          name: name,
          group_id: group_id,
          user_id: user_id,
          position: position,
          weight: weight
        }
      end
    end
  end
end
