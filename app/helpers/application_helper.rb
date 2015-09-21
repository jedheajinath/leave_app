module ApplicationHelper

  def user_notification_url(name,count)
    raw("#{name}&nbsp;<span class='badge'>#{count}</span>")
  end

  def delete_url
    raw("<i class='fa fa-trash-o'></i>")
  end

  def edit_url
    raw("Reason <i class='fa fa-pencil-square-o'></i>")
  end

  def approve_leave_url
    raw("<i class='fa fa-check-circle-o'></i>")
  end

  def daywise_attendence_url(date)
    "/search_daywise_attendence/#{date}"
  end

  def sign_in_url(provider)
    raw("<img src = '/assets/#{provider}.png' width = '300px' height ='40'")
  end
end
