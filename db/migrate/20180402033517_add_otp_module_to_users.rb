class AddOtpModuleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :otp_module, :integer, default: 0
  end
end
