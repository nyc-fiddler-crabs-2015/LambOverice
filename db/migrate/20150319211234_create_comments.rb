class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references    :user, null: false
      t.references    :commentable, polymorphic: true, index: true, null: false
      t.string        :content, null: false

      t.timestamps
    end
  end
end
