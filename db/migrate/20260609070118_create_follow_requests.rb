class CreateFollowRequests < ActiveRecord::Migration[8.1]
  def change
  create_table :follow_requests do |t|
  t.references :follower, null: false, foreign_key: { to_table: :users }
  t.references :followed, null: false, foreign_key: { to_table: :users }
  t.string :status, default: "pending", null: false

  t.timestamps
    end
  end
end
