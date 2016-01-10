require 'rails_helper'

RSpec.describe 'tasks/show', type: :view do
  before(:each) do
    log = create(:ok_log)
    @task = assign(:task, log.task)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Token/)
    expect(rendered).to match(/Period/)

    expect(rendered).to match(/ok/)
    expect(rendered).to match(/MyString/)
  end
end
