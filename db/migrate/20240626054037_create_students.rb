class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :rollno
      t.text :school

      t.timestamps
    end
  end
end
