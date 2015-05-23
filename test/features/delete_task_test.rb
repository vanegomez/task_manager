require_relative '../test_helper'

class DeleteTaskTest < FeatureTest
  def test_delete_a_task
    TaskManager.create(title: "cookies", description: "eat cookies")

    visit "/tasks"

    assert page.has_content?("cookies")

    click_on "Delete"

    refute page.has_content?("cookies")
  end
end
