# All jobs are wrapped in this template.
# http://blog.scoutapp.com/articles/2010/09/07/rvm-and-cron-in-production
set :job_template, "/bin/bash -l -c ':job'"

set :runner_command, "rails runner"

job_type :command, ":task :output"
job_type :rake, "cd :path && :environment_variable=:environment :bundle_command exec rake :task --silent :output"
job_type :runner, "cd :path && :bundle_command exec :runner_command -e :environment ':task' :output"
