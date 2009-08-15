require 'fileutils'
namespace :order_dashboard do
  desc "compile java to javascript"
  task :compile => :environment do
    sh "app/gwt/order_dashboard/OrderDashboard-compile"
  end
  
  desc "run orderdashboard module in hosted mode"
  task :hosted => :environment do
    sh "app/gwt/order_dashboard/OrderDashboard-shell"
  end
  
  desc "clean compiled javascript"
  task :clean => :environment do
    rm_rf("#{RAILS_ROOT}/public/gwt/orderdashboard.OrderDashboard")
  end
end