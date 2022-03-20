class AddJobRecruiterIdToJobsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :recruiter, foreign_key: { to_table: :users }

  end
end
