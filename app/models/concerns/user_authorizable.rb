module UserAuthorizable
  # Only user who authored a reply (or an admin) should be allowed to modify it
  def check_user_authorized(current_user)
    current_user && (current_user.admin? || current_user.id == self.user_id)
  end
end
