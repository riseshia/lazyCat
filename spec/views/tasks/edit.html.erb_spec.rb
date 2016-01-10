require 'rails_helper'

RSpec.describe 'tasks/edit', type: :view do
  before(:each) do
    @task = create(:task)
  end

  it 'renders the edit task form' do
    render

    assert_select 'form[action=?][method=?]', task_path(@task), 'post' do
      assert_select 'input#task_name[name=?]', 'task[name]'

      assert_select 'input#task_period[name=?]', 'task[period]'
    end
  end
end
