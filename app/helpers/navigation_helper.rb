module NavigationHelper
  def show_navigation?
    !(controller_name == 'sessions' || controller_name == 'registrations' || controller_name == 'passwords')
  end
end
