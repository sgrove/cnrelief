require 'fileutils'
namespace :press_setup_dashboard do
  desc "compile java to javascript"
  task :compile => :environment do
    sh "app/gwt/press_setup_dashboard/PressSetupDashboard-compile"
  end
  
  desc "run presssetupdashboard module in hosted mode"
  task :hosted => :environment do
    sh "app/gwt/press_setup_dashboard/PressSetupDashboard-shell"
  end
  
  desc "clean compiled javascript"
  task :clean => :environment do
    rm_rf("#{RAILS_ROOT}/public/gwt/presssetupdashboard.PressSetupDashboard")
  end
end