require "rails_helper"

RSpec.describe CompletionsController do
  describe "POST create" do
    it "creates a completion for the task" do
      task = create(:task)
      sign_in_as(task.user)

      execution = lambda do
        post :create, params: { task_id: task.id }
      end

      expect(&execution).to change { task.reload.completions.count }.by(1)
    end
  end
end
