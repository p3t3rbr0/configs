set from = "peter.brovchenko@gmail.com"
set imap_user = "peter.brovchenko@gmail.com"
set imap_pass = 'you_secret'
set smtp_url = "smtps://peter.brovchenko@gmail.com@smtp.gmail.com:465/"
set smtp_pass = 'you_secret'
set realname = "Peter Brovchenko"

set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set header_cache = ~/.mutt/com.gmail.peter.brovchenko/cache/headers
set message_cachedir = ~/.mutt/com.gmail.peter.brovchenko/cache/bodies
set certificate_file = ~/.mutt/com.gmail.peter.brovchenko/certificates
