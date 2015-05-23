require_relative '../test_helper'

class EditTaskTest < FeatureTest
  def test_edit_task_with_title_and_description
    TaskManager.create(title: "cookies", description: "eat cookies")

    visit "/tasks"
    click_link("Edit")

    # assert_equal TaskManager.last, current_path

    fill_in('task[title]', with: "candy")
    fill_in('task[description]', with: "yummy")
    click_link_or_button "Update"

    assert page.has_content?("candy")
    assert page.has_content?("yummy")
  end
end


