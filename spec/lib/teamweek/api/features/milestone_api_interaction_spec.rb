
require "spec_helper"

describe 'Milestone API interactions', Teamweek::Api::Client, :vcr do

  it "retrieves all milestones" do
    all_milestones = ["Milestone", "Second Milestone"]
    milestones = client.fetch(Teamweek::Api::Milestone)
    expect(milestones.map(&:name)).to match_array all_milestones
  end

  it "retrieves a specific milestone" do
    milestone = client.fetch(Teamweek::Api::Milestone, {id: 319035})
    expect(milestone.map(&:name)).to match_array ["Milestone"]
  end

  it "updates a milestone" do
    milestone_before = client.fetch(Teamweek::Api::Milestone, {id: 319815})
    milestone_after = client.update(Teamweek::Api::Milestone, {id: 319815, name: "Renamed milestone"})
    expect(milestone_before.first.name).to eq "Second Milestone"
    expect(milestone_after.first.name).to eq "Renamed milestone"
  end

  it "removes a milestone" do
    milestone_before = client.fetch(Teamweek::Api::Milestone, {id: 319035})
    client.delete(Teamweek::Api::Milestone, {id: 319035})
    milestone_after = client.fetch(Teamweek::Api::Milestone, {id: 319035})
    expect(milestone_before.first.name).to eq "Milestone"
    expect(milestone_after.first.name).to be_nil
  end

  it "creates a milestone" do
    Timecop.freeze Date.new(2017, 1, 20) do
      milestone = client.create(Teamweek::Api::Milestone, {name: "New milestone", date: Time.now.iso8601})
      expect(milestone.first.name).to eq "New milestone"
    end
  end

  it "retrieves milestones created since a date" do
    Timecop.freeze Date.new(2017, 1, 14) do
      milestones = client.fetch(Teamweek::Api::Milestone, {since: Time.now.iso8601})
      expect(milestones.map(&:name)).to match_array ["Renamed milestone", "New milestone"]
    end
  end

  it "retrieves milestones created until a date" do
    Timecop.freeze Date.new(2017, 1, 14) do
      milestones = client.fetch(Teamweek::Api::Milestone, {until: Time.now.iso8601})
      expect(milestones.map(&:name)).to match_array ["Renamed milestone", "Old milestone"]
    end
  end
end
