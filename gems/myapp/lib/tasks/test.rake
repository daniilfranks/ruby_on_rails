namespace :test do
  desc "Test task"
  task :start => :environment do
    p "Test text: #{1 + 1}"
    Post.create(title: "Random_name_#{rand(1000)}", publication: true)
  end
end
