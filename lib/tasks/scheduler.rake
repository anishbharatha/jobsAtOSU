desc 'This task is called by the Heroku scheduler add-on'
task :update_feed => :environment do
  puts 'Updating feed...'
  Jobs.update_from_feed('https://www.jobsatosu.com/all_jobs.atom.xml')
  puts 'Done updating feed.'
end
