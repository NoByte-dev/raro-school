class AddEmailToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :email, :string, after: :name
  end
end
