class ChangeDefaultColumnUrls < ActiveRecord::Migration[5.2]
  def change
    change_column_default :urls, :accesses, from: nil, to: 0
  end
end
