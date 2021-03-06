# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^(the )?index\s?page$/
      root_path
    when /^(the )?home\s?page$/
      homepage_path
    when /^(the )?signup\s?page$/
      new_user_path
    when /^(the )?search donors page$/
      donors_path
    when /^(the )?dashboard\s?page$/
      dashboard_path      
    when /^(the )?report\s?page$/
      reports_path


    when /^(the )?report\s?creator page$/
      new_report_path
    when /^(the )?(search )?donor page$/
      donors_path
      
# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^(the )?index\s?page$/
      root_path
    when /^(the )?home\s?page$/
      homepage_path
    when /^(the )?signup\s?page$/
      new_user_path
    when /^(the )?search donors page$/
      donors_path
    when /^(the )?dashboard\s?page$/
      dashboard_path      
    when /^(the )?report\s?page$/
      reports_path


    when /^(the )?report\s?creator page$/
      new_report_path
    when /^(the )?(search )?donor page$/
      donors_path
      



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
