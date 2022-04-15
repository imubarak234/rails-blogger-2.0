module DeviseHelper

  def devise_error_messages!
    flash_alerts = []

    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
      sentence = I18n.t("devise.failure.invalid") #=> "Invalid email or password."
    else
      sentence = I18n.t("errors.messages.not_saved",
                        count: resource.errors.count,
                        resource: resource.class.model_name.human.downcase)
    end

    return "" if resource.errors.empty? && flash_alerts.empty?

    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages
    messages = errors.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger">
      <div id="error_explanation">
        <strong>#{sentence}</strong>
        <ul class="m-b-0 p-l-30 ">#{messages}</ul>
      </div>
    </div>
    HTML

    html.html_safe
  end

end