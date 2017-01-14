
require "spec_helper"

describe 'Project API interactions', Teamweek::Api::Client, :vcr do

  it "retrieves all projects" do
    all_projects = ["My first project", "My second project", "New project"]
    projects = client.fetch(Teamweek::Api::Project)
    expect(projects.map(&:name)).to match_array all_projects
  end

  it "retrieves a specific project" do
    project = client.fetch(Teamweek::Api::Project, {id: 1258677})
    expect(project.map(&:name)).to match_array ["My first project"]
  end

  it "updates a project" do
    project_before = client.fetch(Teamweek::Api::Project, {id: 1258677})
    project_after = client.update(Teamweek::Api::Project, {id: 1258677, name: "Renamed project"})
    expect(project_before.first.name).to eq "My first project"
    expect(project_after.first.name).to eq "Renamed project"
  end

  it "removes a project" do
    project_before = client.fetch(Teamweek::Api::Project, {id: 1260706})
    client.delete(Teamweek::Api::Project, {id: 1260706})
    project_after = client.fetch(Teamweek::Api::Project, {id: 1260706})
    expect(project_before.first.name).to eq "New project"
    expect(project_after.first.name).to be_nil
  end

  it "creates a project" do
    project = client.create(Teamweek::Api::Project, {name: "New project"})
    expect(project.first.name).to eq "New project"
  end

  it "import projects" do
    projects = [{name: "Project One"}, {name: "Project Two"}, {name: "Project Three"}]
    response = client.import_projects(projects)
    expect(response.map(&:name)).to match_array ["Project One", "Project Two", "Project Three"]
  end
end
