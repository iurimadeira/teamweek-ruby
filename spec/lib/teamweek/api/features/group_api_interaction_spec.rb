
require "spec_helper"

describe 'Group API interactions', Teamweek::Api::Client, :vcr do

  it "retrieves all groups" do
    all_groups = ["First user group", "New group"]
    groups = client.fetch(Teamweek::Api::Group)
    expect(groups.map(&:name)).to match_array all_groups
  end

  it "retrieves a specific group" do
    group = client.fetch(Teamweek::Api::Group, {id: 175052})
    expect(group.map(&:name)).to match_array ["First user group"]
  end

  it "updates a group" do
    group_before = client.fetch(Teamweek::Api::Group, {id: 175052})
    group_after = client.update(Teamweek::Api::Group, {id: 175052, name: "Renamed group"})
    expect(group_before.first.name).to eq "First user Group"
    expect(group_after.first.name).to eq "Renamed group"
  end

  it "removes a group" do
    group_before = client.fetch(Teamweek::Api::Group, {id: 175052})
    client.delete(Teamweek::Api::Group, {id: 175052})
    group_after = client.fetch(Teamweek::Api::Group, {id: 175052})
    expect(group_before.first.name).to eq "First user group"
    expect(group_after.first.name).to be_nil
  end

  it "creates a group" do
    Timecop.freeze Date.new(2017, 1, 20) do
      group = client.create(Teamweek::Api::Group, {name: "New group", date: Time.now.iso8601})
      expect(group.first.name).to eq "New group"
    end
  end
end
