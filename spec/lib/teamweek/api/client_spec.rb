require 'spec_helper'

describe Teamweek::Api::Client, :vcr do
  let(:client) { Teamweek::Api::Client.new(http_client, workspace) }

  it 'retrieves all tasks' do
    tasks = ["Test", "Drag from backlog to assign a task to someone", "Sticky tasks will stay in the backlog"]
    expect(client.fetch(Teamweek::Api::Task, ['tasks']).map(&:name)).to eq tasks
  end

  it 'retrieves all tasks from backlog' do
    tasks = ["Drag from backlog to assign a task to someone", "Sticky tasks will stay in the backlog"]
    expect(client.fetch(Teamweek::Api::Task, ['tasks', 'backlog']).map(&:name)).to eq tasks
  end

  it 'retrieves all tasks from timeline' do
    tasks = ["Test"]
    expect(client.fetch(Teamweek::Api::Task, ['tasks', 'timeline']).map(&:name)).to eq tasks
  end
end
