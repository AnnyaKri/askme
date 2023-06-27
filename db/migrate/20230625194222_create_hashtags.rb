class CreateHashtags < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtags do |t|
      t.string :body, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
