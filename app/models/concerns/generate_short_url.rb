module GenerateShortUrl
  extend ActiveSupport::Concern

  included do
    before_validation :generate_short_url, on: :create
  end

  class_methods do
    def short_url(params = {})
      length = params[:length] || 3
      define_method("generate_short_url") do
        short_url = SecureRandom.hex(length)
        while self.class.where(short_url: short_url).exists?
          short_url = SecureRandom.hex(length)
        end

        self.short_url = short_url
      end
    end
  end
end
