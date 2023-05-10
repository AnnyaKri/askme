module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end
  def user_color
    current_user&.navbar_color || User::DEFAULT_NAVBAR_COLOR
  end
end
