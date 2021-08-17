class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :name, null: false, default: ""
      t.text :text, default: ""

      t.timestamps
    end
  end
end
