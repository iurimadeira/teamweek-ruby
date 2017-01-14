
require "spec_helper"

describe 'GroupMembership API interactions', Teamweek::Api::Client, :vcr do

  it "retrieves all group_memberships from a group" do
    all_group_memberships = [599779, 599780, 599781]
    group_memberships = client.fetch(Teamweek::Api::GroupMembership, {group_id: 175548})
    expect(group_memberships.map(&:id)).to match_array all_group_memberships
  end

  it "updates a group_membership" do
    group_membership = client.update(Teamweek::Api::GroupMembership, {group_id: 175548, id: 599781, weight: 10})
    expect(group_membership.first.weight).to eq 10
  end

  it "removes a group_membership" do
    group_memberships_before = client.fetch(Teamweek::Api::GroupMembership, {group_id: 175548})
    client.delete(Teamweek::Api::GroupMembership, {group_id: 175548, id: 599782})
    group_memberships_after = client.fetch(Teamweek::Api::GroupMembership, {group_id: 175548})

    expect(group_memberships_before.map(&:id)).to include 599782
    expect(group_memberships_after.map(&:id)).to_not include 599782
  end

  it "creates a group_membership" do
    Timecop.freeze Date.new(2017, 1, 20) do
      group_membership = client.create(Teamweek::Api::GroupMembership, {group_id: 175548, user_id: 1054513})
      expect(group_membership.first.user_id).to eq 1054513
    end
  end
end
