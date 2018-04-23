module BeachesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_beaches_path
    elsif action_name == 'edit'
      beach_path
    end
  end 
end
