class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :node, index: true, null: false
      t.string :title, limit: 200, null: false
      t.string :short_title, limit: 80, default: nil
      t.integer :comments_count, default: 0
      t.integer :sort_rank, default: 0
      t.string :color, limit: 10, default: nil
      t.string :writer, limit: 20, default: nil
      t.string :thumb, default: nil
      t.string :source, limit: 30, default: nil
      t.string :seo_title, default: nil
      t.string :seo_keywords, default: nil
      t.string :seo_description, default: nil
      t.boolean :focus, default: false, index: true
      t.boolean :hot, default: false, index: true
      t.integer :status, default: 0
      t.timestamps null: false
    end
  end
end
