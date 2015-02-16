class ChangeContentTypeInJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :content, :text
  end
end
