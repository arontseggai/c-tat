class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.string :author
      t.string :content
      t.string :provider
      t.integer :provider_id
      t.string :perma_link

      t.timestamps
    end
  end
end
