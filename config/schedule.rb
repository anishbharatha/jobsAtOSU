set :output, "#{path}/log/cron.log"
every 1.minute do
   runner "Jobs.update_from_feed(\"https://www.jobsatosu.com/all_jobs.atom.xml\")"
 end