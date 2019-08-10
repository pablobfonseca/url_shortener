class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :title
      t.string :original_url
      t.string :shortened_url
      t.integer :accesses

      t.timestamps
    end

    add_index :urls, :shortened_url
    add_index :urls, :accesses
  end
end
