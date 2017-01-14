module Teamweek
  module Api
    class Milestone < Resource
      attr_accessor :id
      attr_accessor :foreign_id
      attr_accessor :name
      attr_accessor :date
      attr_accessor :done
      attr_accessor :holiday
      attr_accessor :group_id

      def to_hash
        {
          id: id,
          name: name,
          date: date,
          done: done,
          holiday: holiday,
          group_id: group_id
        }
      end
    end
  end
end
