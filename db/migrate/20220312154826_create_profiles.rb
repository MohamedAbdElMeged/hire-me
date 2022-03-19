class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :cv
      t.string :current_job
      t.string :description
      t.string :github_link
      t.string :linkedin_link
      t.belongs_to :company,null: true,foreign_key: true
      t.timestamps
    end
  end
end
