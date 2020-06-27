class AddBookStatusToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :book_status, :boolean, default: false
  end
end
