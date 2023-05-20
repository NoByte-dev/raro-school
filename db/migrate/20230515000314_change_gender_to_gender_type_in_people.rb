class ChangeGenderToGenderTypeInPeople < ActiveRecord::Migration[7.0]
  def change
    rename_column :people, :gender, :gender_type
    change_column :people, :gender_type, :integer, null: false
  end
end
