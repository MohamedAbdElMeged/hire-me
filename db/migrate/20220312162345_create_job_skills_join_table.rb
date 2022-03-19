class CreateJobSkillsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :jobs, :skills do |t|
      t.index :job_id
      t.index :skill_id
    end
  end
end
