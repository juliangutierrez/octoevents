class ChangeCodeToNumberInIssues < ActiveRecord::Migration[6.1]
  def change
    rename_column :issues, :code, :number
  end
end
