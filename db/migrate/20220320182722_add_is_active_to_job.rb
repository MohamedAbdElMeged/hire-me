class AddIsActiveToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :is_active, :boolean
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
