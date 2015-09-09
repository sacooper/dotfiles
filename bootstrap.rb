#!/usr/bin/env ruby

ignore = [".", "..", ".git", "bootstrap.rb", "README.md", "LICENSE", "bootstrap.sh"]
files = Dir.entries(".")
to_sync = files - ignore

OLD_DIR = File.join(Dir.home, "old_dotfiles")

def bckup(file)
    Dir.mkdir OLD_DIR unless Dir.exist? OLD_DIR 
    puts("#{File.join(OLD_DIR, File.basename(file))}")
    File.rename(file, File.join(OLD_DIR, File.basename(file)))
end

to_sync.each do |f|
    orig = File.join(Dir.pwd, f)
    lnk = File.join(Dir.home, f)
    File.delete lnk if File.symlink? lnk
    bckup lnk if File.exist? lnk
    File.symlink(orig, lnk)
end
    
