class NotifyUsersOfCurrentTask
  def self.run
    User.where(id: Task.select(:user_id)).find_each do |user|
      CompletionsMailer.notify(user.current_task).deliver_later
    end
  end
end
