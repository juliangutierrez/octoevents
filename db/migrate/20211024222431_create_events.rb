class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :action
      t.references :issue, index: true

      t.timestamps
    end
  end
end
