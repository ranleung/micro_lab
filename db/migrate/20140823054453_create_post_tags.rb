class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
    	t.references :tag
    	t.references :post
      t.timestamps
    end
  end
end
