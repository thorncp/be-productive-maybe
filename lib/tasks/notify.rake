namespace :notify do
  desc "Notify all users of current task"
  task current_task: :environment do
    NotifyUsersOfCurrentTask.run
  end
end
