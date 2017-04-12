desc "print active suppliers"
task :active_suppliers  => :environment do
   Supplier.all.each{ |s| puts "#{s.name}, #{s.address}" }
end
