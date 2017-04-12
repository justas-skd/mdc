desc "print active suppliers"
task :active_products  => :environment do
   Supplier.all.each{ |s|  puts "#{s.name}, #{s.address}"
      s.products.each_with_index{ |p, index| puts "\t #{index+1} #{p.ean}, #{p.description}"} }
end
