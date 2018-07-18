class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :locale
      t.string :email
      t.string :facebook_id
      t.string :birth_place
      t.string :major
      t.integer :age
      t.string :expectation

      t.timestamps
    end
  end
end
