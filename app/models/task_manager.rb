require "yaml/store"

class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == "test"
      @database ||= Sequel.sqlite('db/task_manager_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/task_manager_dev.sqlite3')
    end
  end

  def self.create(task)
    dataset.insert(task)
  end

  def self.all
    dataset.map do |data|
      Task.new(data)
    end
  end

  def self.find(id)
    task = dataset.where(id: id)
    Task.new(task.to_a.first)
  end

  def self.update(id, data)
    dataset.where(id: id).update(data)
  end

  def self.destroy(id)
    dataset.where(id: id).delete
  end

  def self.delete_all
    dataset.delete
  end

  private

  def self.dataset
    database.from(:tasks)
  end
end
