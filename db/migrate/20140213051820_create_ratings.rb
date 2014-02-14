class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
			t.references :post
			t.integer :stars
      t.timestamps
		end
		add_index :ratings, :post_id
  end
end
