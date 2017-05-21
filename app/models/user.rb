class User < ApplicationRecord
  include Clearance::User

  has_many :tasks, dependent: :destroy

  def current_task
    join_clause = <<~SQL
      LEFT OUTER JOIN (
        SELECT
          task_id,
          MAX(completed_at) completed_at
        FROM
          completions
        GROUP BY
          task_id
      ) AS recent_completions
      ON recent_completions.task_id = tasks.id
    SQL

    tasks.
      joins(join_clause).
      order("recent_completions.completed_at NULLS FIRST, tasks.created_at").
      first
  end
end
