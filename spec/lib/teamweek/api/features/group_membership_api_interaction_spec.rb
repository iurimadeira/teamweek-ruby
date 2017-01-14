
require "spec_helper"

describe 'GroupMembership API interactions', Teamweek::Api::Client, :vcr do

  xit "retrieves all group_memberships from a group" do
    all_group_memberships = []
    group_memberships = client.fetch(Teamweek::Api::GroupMembership, {group_id: 175052})
    expect(group_memberships.map(&:user_id)).to match_array all_group_memberships
  end

  xit "updates a group_membership" do
    group_membership = client.update(Teamweek::Api::GroupMembership, {group_id: 175052, id: 598083, user_id: 1054512})
    expect(group_membership.first.user_id).to eq 1054512
  end

  xit "removes a group_membership" do
    group_memberships_before = client.fetch(Teamweek::Api::GroupMembership, {group_id: 175052})
    client.delete(Teamweek::Api::GroupMembership, {id: 598083})
    group_memberships_after = client.fetch(Teamweek::Api::GroupMembership, {group_id: 175052})

    expect(group_memberships_before.map(&:user_id)).to include ""
    expect(group_memberships_before.map(&:user_id)).to_not include ""
  end

  xit "creates a group_membership" do
    Timecop.freeze Date.new(2017, 1, 20) do
      group_membership = client.create(Teamweek::Api::GroupMembership, {group_id: 175052,  user_id: 1054512})
      expect(group_membership.first.user_id).to eq 175052
    end
  end
end
