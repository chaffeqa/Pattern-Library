class Thumbnail < ActiveRecord::Base
  belongs_to :pattern

  validates_presence_of :source, :data
  validate :check_data_size?

  def check_data_size?
#    errors.add_to_base("Your image file size is too big") if self.data.bytesize > 50.kilobytes
  end

  def uploaded_picture=(picture_field)
    base_part_of(picture_field.original_filename)
#    self.content_type = picture_field.content_type.chomp
    self.data = picture_field.read
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '' )
  end
end
