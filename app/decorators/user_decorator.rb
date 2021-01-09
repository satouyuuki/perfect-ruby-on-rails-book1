# frozen_string_literal: true
# coding: utf-8
module UserDecorator
  def full_name
    "#{first_name} #{last_name}"
  end
  def email_link(body = nil, &block)
    if block_given?
      link_to("mailto:#{email}", &block)
    else
      link_to(body, "mailto:#{email}")
    end
  end

  def hoge
    "hogehoge"
  end
end
