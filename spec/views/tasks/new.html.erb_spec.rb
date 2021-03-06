require 'rails_helper'

RSpec.describe 'tasks/new', type: :view do
  before(:each) do
    assign(:task, build(:task))
  end

  it 'renders new task form' do
    render

    assert_select 'form[action=?][method=?]', tasks_path, 'post' do
      assert_select 'input#task_name[name=?]', 'task[name]'

      assert_select 'input#task_period[name=?]', 'task[period]'
    end
  end
end
