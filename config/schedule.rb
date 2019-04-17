every 1.day do
  rake "start:running"
  command "/usr/bin/my_great_command"
end
# whenever --update-crontab --set environment='development'
