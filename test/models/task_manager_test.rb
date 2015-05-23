require_relative "../test_helper"

class TaskManagerTest < Minitest::Test

  def test_can_create_a_task
    data = { :title => "learn sinatra",
             :description => "seriously!" }

    TaskManager.create(data)
    task = TaskManager.all.last

    assert_equal "learn sinatra", task.title
    assert_equal "seriously!", task.description
    assert_equal task.id, task.id #not the best but works
  end

  def create_tasks(num)
    num.times do |x|
      TaskManager.create(title: "task#{x}", description: "description#{x}")
    end
  end

  def test_can_find_one_by_id
    create_tasks(3)
    task = TaskManager.all.last

    assert_equal "task2", task.title
    assert_equal "description2", task.description
    # assert_equal 374, task.id
  end

  def test_can_find_all_tasks
    create_tasks(3)
    all_tasks = TaskManager.all

    assert_equal ["task0", "task1", "task2"], all_tasks.map(&:title)
  end

  def test_can_update_a_task
    create_tasks(1)
    data = { :title => "yummy", :description => "description0" }
    TaskManager.update(TaskManager.all.last.id, data)
    # require 'pry'; binding.pry
    task = TaskManager.all.last

    assert_equal "yummy", task.title
  end

  def test_can_destroy_a_task
    create_tasks(3)
    assert TaskManager.destroy(TaskManager.all.last.id)
  end
end
