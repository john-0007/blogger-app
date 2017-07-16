module ApplicationHelper
  def render_user_aut_nav
    if current_user
      render 'sing_in'
    else
      render 'sing_out'
    end
  end
end
