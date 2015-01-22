def fig(name,placement='',options={})
  default_options = {
    'foo'=>'bar'
  }
  default_options.each { 
    |option,default|
    if options[option]==nil then
      options[option]=default
    end
  }
  print "\\fig[#{placement}]{#{name}}\n"
  File.open('figures.csv','a') { |f|
    rbtex = ENV['RBTEX']
    rbtex =~ /^ch(\d+)/
    ch = $1.to_i
    f.print "#{ch},#{name}\n"
  }
end
