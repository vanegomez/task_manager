require_relative '../test_helper'

class CreateTaskTest < FeatureTest
  def test_create_task_with_title_and_description
    visit "/tasks/new"
    fill_in("task[title]", with:"cookies")
    fill_in("task[description]", with:"eat cookies")
    click_button("submit")

    assert page.has_content?("cookies")

    visit "/tasks/1"
    assert page.has_content?("eat cookies")
  end
end
