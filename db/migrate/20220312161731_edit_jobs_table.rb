class EditJobsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :level, :string
    add_column :jobs, :type, :string
    add_column :jobs, :years_of_exp, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
