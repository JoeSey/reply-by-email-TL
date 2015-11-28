# name: reply_by_email_TL
# about: Add site setting to restrict reply-by-email to trust level x and above
# version: 0.0.1
# authors: Joerg Seyfried (JSey)
# url: https://github.com/JSey/reply-by-email-TL

require_dependency 'email/message_builder'

enabled_site_setting :reply_by_email_TL_enabled

after_initialize do
  class MessageBuilder
    class << self
      def allow_reply_by_email?
        SiteSetting.reply_by_email_enabled? &&
        # either we're disabled or recipient's TL needs to be above or equal to the min setting
        ( !SiteSetting.reply_by_email_enabled || User.find_by(email: @to).trust_level >= SiteSetting.reply_by_email_TL_min ) &&
        reply_by_email_address.present? &&
        @opts[:allow_reply_by_email]
      end
    end
  end
end