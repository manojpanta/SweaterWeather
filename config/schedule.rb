every 100.minute do
  rake "start:running"
  command "/usr/bin/my_great_command"
end
# whenever --update-crontab --set environment='development'
