require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [create(:task)])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Task 01".to_s, :count => 1
    assert_select "tr>td", :text => "3600".to_s, :count => 1
  end
end
