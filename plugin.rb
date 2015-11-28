# name: reply-by-email-TL
# about: Add site setting to restrict reply-by-email to trust level x and above
# version: 0.0.1
# authors: Joerg Seyfried (JSey)
# url: https://github.com/JSey/reply-by-email-TL

require_dependency 'email/message_builder'

enabled_site_setting :enable_reply_by_email_TL

after_initialize do
  class MessageBuilder
    class << self
      def allow_reply_by_email?
        SiteSetting.reply_by_email_enabled? &&
        # argh: need to search recipient to determine TL...
        ( !SiteSetting.enable_reply_by_email || User.find_by(email: @to).trust_level > SiteSetting.reply_by_email_TL ) &&
        reply_by_email_address.present? &&
        @opts[:allow_reply_by_email]
      end
    end
  end
end