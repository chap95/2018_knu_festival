class CreateJaus < ActiveRecord::Migration[5.1]
  def change
    create_table :jaus do |t|
      t.string :user_key
      t.string :content

      t.timestamps
    end
  end
end
