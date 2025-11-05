#!/bin/bash
echo 'Looking up specs labeled with "version_"...'
echo '' > app/views/project_management/index.html.erb
echo $'<%= link_to \'Back\', root_path %>' >> app/views/project_management/index.html.erb
echo '<ul>' >> app/views/project_management/index.html.erb
bundle exec rspec | grep -oP 'version_\K(.+)' | sort | sed 's/^/<li>v/' | sed 's/$/<\/li>/' >> app/views/project_management/index.html.erb
echo '</ul>' >> app/views/project_management/index.html.erb
echo 'DONE'
