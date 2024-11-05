# frozen_string_literal: true

plugin = self

namespace :cron do # rubocop:disable Metrics
  desc "Update cron configuration"
  task :update do
    on roles(fetch(:cron_roles)) do
      plugin.update_crontab
    end
  end

  desc "Clear cron configuration"
  task :clear do
    on roles(fetch(:cron_roles)) do
      plugin.clear_crontab
    end
  end
end
