require 'rake'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :default => :spec

namespace :spec do
  targets = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    target = File.basename(dir)
    target = "_#{target}" if target == "default"
    targets << target
  end

  task :all     => targets
  task :default => :all

  targets.each do |target|
    original_target = target == "_default" ? target[1..-1] : target
    desc "Run serverspec tests to #{original_target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = original_target
      t.pattern = "spec/#{original_target}/*_spec.rb"
    end
  end
end

namespace :unicorn do

   # Tasks
   desc "Start unicorn"
   task(:start) {
     require_relative 'config/environment'
     config = Rails.root.join('config', 'unicorn.rb')
     sh "unicorn -c #{config} -E production -D"
   }

   desc "Stop unicorn"
   task(:stop) {
     require_relative 'config/environment'
     unicorn_signal :QUIT
   }

   desc "Restart unicorn with USR2"
   task(:restart) {
     require_relative 'config/environment'
     unicorn_signal :USR2
   }

   desc "Increment number of worker processes"
   task(:increment) {
     require_relative 'config/environment'
     unicorn_signal :TTIN
   }

   desc "Decrement number of worker processes"
   task(:decrement) {
     require_relative 'config/environment'
     unicorn_signal :TTOU
   }

   desc "Unicorn pstree (depends on pstree command)"
   task(:pstree) do
     require_relative 'config/environment'
     sh "pstree '#{unicorn_pid}'"
   end

   # Helpers
   def unicorn_signal signal
     Process.kill signal, unicorn_pid
   end

   def unicorn_pid
     begin
       File.read("/var/www/raisetech-live8-sample-app/tmp/unicorn.pid").to_i
     rescue Errno::ENOENT
       raise "Unicorn does not seem to be running"
     end
   end

end