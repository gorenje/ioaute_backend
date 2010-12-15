#
# Author: Gerrit Riessen, gerrit.riessen@open-source-consultants.de
# Copyright (C) 2010 Gerrit Riessen
# This code is licensed under the GNU Public License.
# 

namespace :sass do
  desc 'Updates stylesheets if necessary from their Sass templates.'
  task :update => :environment do
    Sass::Plugin.update_stylesheets
  end
end
