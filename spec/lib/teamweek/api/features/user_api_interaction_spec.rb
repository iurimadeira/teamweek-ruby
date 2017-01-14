
require "spec_helper"

describe 'User API interactions', Teamweek::Api::Client, :vcr do

  it "retrieves all users" do
    all_users = ["Iuri", "Caroline", "Hugo"]
    users = client.fetch(Teamweek::Api::User)
    expect(users.map(&:name)).to match_array all_users
  end

  it "updates an user profile" do
    user_after = client.update(Teamweek::Api::User, {context: "profile", id: 1054464, name: "Mel"})
    expect(user_after.first.name).to eq "Mel"
  end

  it "removes a user" do
    client.delete(Teamweek::Api::User, {id: 1054512})
    users = client.fetch(Teamweek::Api::User)
    expect(users.map(&:id)).to_not include 1054512
  end

  it "creates a user" do
    user = client.create(Teamweek::Api::User, {name: "Tequila"})
    expect(user.first.name).to eq "Tequila"
  end

  it "invites a user" do
    user = client.update(Teamweek::Api::User, {id: 1055865, email: "tequila@example.com", context: 'email'})
    expect(user.first.email).to eq "tequila@example.com"
  end

  xit "import users"
end
