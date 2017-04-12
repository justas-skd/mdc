desc "print active suppliers"
task :products_not_older_than, [:xx] => [:environment] do |task, args|
   Supplier.all.each{ |s|  puts "#{s.name}, #{s.address}"
      s.products.where("created_at >= ?", args.xx.to_i.minutes.ago).each_with_index{ |p, index| puts " \t #{index+1} #{p.ean}, #{p.description}"} }
end
# rails "products_not_older_than[55]"
