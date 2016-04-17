require "administrate/base_dashboard"

class TalkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    speaker: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    start: Field::DateTime,
    finish: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :speaker,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :speaker,
    :id,
    :title,
    :description,
    :start,
    :finish,
    :created_at,
    :updated_at,
    :slug,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :speaker,
    :title,
    :description,
    :start,
    :finish,
  ]

  # Overwrite this method to customize how talks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(talk)
  #   "Talk ##{talk.id}"
  # end
end
