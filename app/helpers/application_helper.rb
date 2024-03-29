# frozen_string_literal: true

module ApplicationHelper
  def active?(path, options = {})
    if options.key? :active_if
      'active' if options[:active_if]
    elsif current_page?(path)
      'active'
    end
  end

  def nav_menu_item(name, path = '#', options = {})
    assembled_options = options.merge(class: "nav-link link-dark #{active?(path)}")

    tag.li class: 'nav-item' do
      link_to path, assembled_options do
        tag.div(name)
      end
    end
  end

  def flash_color(type)
    {
      success: 'alert-success',
      notice: 'alert alert-info',
      alert: 'alert-danger',
      danger: 'alert-danger',
      error: 'alert-danger'
    }[type.to_sym] || 'alert-warning'
  end
end
