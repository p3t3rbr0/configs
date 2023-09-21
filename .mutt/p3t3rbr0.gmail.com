set from = "p3t3rbr0@gmail.com"
set imap_user = "p3t3rbr0@gmail.com"
set imap_pass = 'you_secret'
set smtp_url = "smtps://p3t3rbr0@gmail.com@smtp.gmail.com:465/"
set smtp_pass = 'you_secret'
set realname = "P3t3rbr0"

set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set header_cache = ~/.mutt/com.gmail.p3t3rbr0/cache/headers
set message_cachedir = ~/.mutt/com.gmail.p3t3rbr0/cache/bodies
set certificate_file = ~/.mutt/com.gmail.p3t3rbr0/certificates
