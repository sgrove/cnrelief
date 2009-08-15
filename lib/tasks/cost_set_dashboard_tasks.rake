require 'fileutils'
namespace :cost_set_dashboard do
  desc "compile java to javascript"
  task :compile => :environment do
    sh "app/gwt/cost_set_dashboard/CostSetDashboard-compile"
  end
  
  desc "run costsetdashboard module in hosted mode"
  task :hosted => :environment do
    sh "app/gwt/cost_set_dashboard/CostSetDashboard-shell"
  end
  
  desc "clean compiled javascript"
  task :clean => :environment do
    rm_rf("#{RAILS_ROOT}/public/gwt/costsetdashboard.CostSetDashboard")
  end
end