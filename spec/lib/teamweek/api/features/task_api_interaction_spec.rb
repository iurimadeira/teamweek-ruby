
require "spec_helper"

describe 'Task API interactions', Teamweek::Api::Client, :vcr do
  let(:all_tasks) { ["Test", "Drag from backlog to assign a task to someone", "Sticky tasks will stay in the backlog"] }
  let(:tasks_from_backlog) { ["Drag from backlog to assign a task to someone", "Sticky tasks will stay in the backlog"] }
  let(:tasks_from_timeline) { ["Test"] }

  it "retrieves all tasks" do
    tasks = client.fetch(Teamweek::Api::Task)
    expect(tasks.map(&:name)).to match_array all_tasks
  end

  it "retrieves all tasks from backlog" do
    tasks = client.fetch(Teamweek::Api::Task, {context: "backlog"})
    expect(tasks.map(&:name)).to match_array tasks_from_backlog
  end

  it "retrieves all tasks from timeline" do
    tasks = client.fetch(Teamweek::Api::Task, {context: "timeline"})
    expect(tasks.map(&:name)).to match_array tasks_from_timeline
  end

  it "retrieves a specific task" do
    task = client.fetch(Teamweek::Api::Task, {id: 7375749})
    expect(task.map(&:name)).to match_array ["Test"]
  end

  it "updates a task" do
    task_before = client.fetch(Teamweek::Api::Task, {id: 7375749})
    task_after = client.update(Teamweek::Api::Task, {id: 7375749, name: "Testing"})
    expect(task_before.first.name).to eq "Test"
    expect(task_after.first.name).to eq "Testing"
  end

  it "removes a task" do
    task_before = client.fetch(Teamweek::Api::Task, {id: 7375749})
    client.delete(Teamweek::Api::Task, {id: 7375749})
    task_after = client.fetch(Teamweek::Api::Task, {id: 7375749})
    expect(task_before.first.name).to eq "Test"
    expect(task_after.first.name).to be_nil
  end

  it "creates a task" do
    Timecop.freeze Date.new(2017, 1, 14) do
      task = client.create(Teamweek::Api::Task, {name: "New Task", date: Date.today})
      expect(task.first.name).to eq "New Task"
    end
  end

  it "retrieves tasks created since a date" do
    Timecop.freeze Date.new(2017, 1, 14) do
      tasks = client.fetch(Teamweek::Api::Task, {since: Time.now.iso8601})
      expect(tasks.map(&:name)).to match_array ["Today's task", "Task from the future"]
    end
  end

  it "retrieves tasks created until a date" do
    Timecop.freeze Date.new(2017, 1, 14) do
      tasks = client.fetch(Teamweek::Api::Task, {until: Time.now.iso8601})
      expect(tasks.map(&:name)).to match_array ["Task from the past", "Today's task"]
    end
  end

  it "retrieves tasks created by an user" do
    tasks_by_user = ["Task from the future", "Task from the past", "Today's task", "Drag from backlog to assign a task to someone", "Sticky tasks will stay in the backlog"]
    tasks = client.fetch(Teamweek::Api::Task, {user: 1054464})
    expect(tasks.map(&:name)).to match_array tasks_by_user
  end

  it "retrieves tasks from a project" do
    tasks_by_project = ["Today's task"]
    tasks = client.fetch(Teamweek::Api::Task, {project: 1258677})
    expect(tasks.map(&:name)).to match_array tasks_by_project
  end

  it "import tasks" do
    tasks = [{name: "Task One"}, {name: "Task Two"}, {name: "Task Three"}]
    response = client.import_tasks(tasks)
    expect(response.map(&:name)).to match_array ["Task One", "Task Two", "Task Three"]
  end

end
