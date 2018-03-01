namespace :create_env_file do
  desc "Add SECRET_KEY"
  task :add_secret_key => :environment do
    dir = "#{Rails.root}/.env"

    FileUtils.rm(dir) if File.exists? dir
    FileUtils.touch(".env") unless File.exists? dir

    File.open("#{dir}", "r+") do |f|
      user_name = ENV["username"] || "root"
      password = ENV["password"] || " "
      secret_key = SecureRandom.hex 64

      f.write "USERNAME = #{user_name}\n"
      f.write "PASSWORD = #{password}\n"
      f.write "SECRET_KEY = #{secret_key}"
    end

    puts "CREATED .env FILE!"
  end
end
