class AddFieldsToEndPoint < ActiveRecord::Migration
  def change
    add_column :end_points, :code, :integer
    add_column :end_points, :enqueue_time, :datetime
    add_column :end_points, :request_start_time, :datetime
    add_column :end_points, :request_end_time, :datetime
  end
end
