# rails first:hello
namespace :first do
  desc 'Hello rake in rails'
  task :hello => :environment do
    puts 'Hello rails!'
  end
end
