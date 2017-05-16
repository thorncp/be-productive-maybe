class TasksPage < PageObject
  def has_task?(description)
    has_selector?("input[value='#{description}']")
  end
end
