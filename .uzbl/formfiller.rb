#!/usr/bin/env ruby
require 'json'

FORMS_FILE=File.join(ENV['HOME'], '.uzbl_forms')
File.open(FORMS_FILE, 'r') do |fl|
    File.open(ENV['UZBL_FIFO'], 'w+') do |o|
        forms = JSON.parse(fl.read)
        domain=ENV['UZBL_URI'].gsub(/https?:\/\//, "").gsub(/\/.*/, "")
        if forms[domain] then
            forms[domain].each do |f|
                val=`pass show #{f['value']}`.chomp.gsub('@', '\\@') # Need to escape the @ symbol - no idea why

                if val == "" then
                    o.puts "js alert('Could not retrieve value');"
                    exit 1
                end

                if f['type'] == 'id' then
                    o.puts "js try {document.getElementById('#{f['name']}').value = '#{val}';}catch(e){}"
                elsif f['type'] == 'name' then
                    o.puts "js try {document.getElementsByName('#{f['name']}')[0].value = '#{val}';}catch(e){}"
                else
                    exit 1
                end
            end
        end
    end
end
