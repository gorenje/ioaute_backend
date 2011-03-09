#
# Author: Gerrit Riessen, gerrit.riessen@open-source-consultants.de
# Copyright (C) 2010 Gerrit Riessen
# This code is licensed under the GNU Public License.
# 

require 'fileutils'

namespace :editor do
  desc <<-EOF
   This deploys the cappuccino editor into our public directory and 
   makes necessary changes.
   This assumes that the cappuccino editor is located in ../editor (relative to the 
   location of the Rakefile).
  EOF
  task :install => :environment do
    startTime = Time.now
    puts "1. Building editor with jake - " + startTime.to_s
    results = `cd #{Rails.root}/../editor && rm -fr Build && jake flatten 2>&1`
    puts ">>> This is what jake had to say: "
    puts "==========================================="
    puts results
    puts "==========================================="

    puts "2. Moving to public directory"
    src_dir = "#{Rails.root}/../editor/Build/Flatten/PublishMeEditor"
    dirname, base_dest_dir = File.basename(src_dir), "#{Rails.root}/public"

    unless src_dir.blank? or dirname.blank?
      puts ">>> Determined jake deploy directory to be '#{src_dir}'"
      FileUtils.rm_rf("#{base_dest_dir}/#{dirname}")
      puts `rsync -rlpgoD --delete --dirs --checksum  #{src_dir} #{base_dest_dir}/`
      # require because the editor uses relative paths for images and the editor
      # is accessed under ..../publications/new
      unless File.exists?("#{base_dest_dir}/publications")
        FileUtils.ln_s("#{base_dest_dir}/#{dirname}", "#{base_dest_dir}/publications") 
      end

      # add timestamp to the JS requests.
      erb = ERB.new(File.open("#{Rails.root}/config/remote_files/Application.js.erb").read)
      File.open("#{base_dest_dir}/publications/Application.js", "w+") << erb.result(binding)

      # gzip everything so that nginx doesn't need to do this each time.
      ( Dir.glob("#{base_dest_dir}/publications/*.js") +
        Dir.glob("#{base_dest_dir}/javascripts/*.js") +
        Dir.glob("#{base_dest_dir}/publications/Resources/*.cib")
      ).each do |filename|
        `rm -f #{filename}.gz && gzip -9 -c #{filename} > #{filename}.gz`
      end
      
      `open -a Safari "http://localhost:3000"`
    else
      puts("!!ERROR!!: did nothing because i could not determine "+
           "the output directory from jake")
      exit 1
    end
    puts ("Time taken: %0.2f seconds" % (Time.now - startTime))
  end
end
