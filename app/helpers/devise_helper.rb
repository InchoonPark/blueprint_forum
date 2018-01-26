module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    message = resource.errors.full_messages[0]

    javascript_tag(
      "toastr.error(\"#{j raw(message)}\")"
    )
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
