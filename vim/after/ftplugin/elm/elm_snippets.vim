set et
set sw=4
set ts=4

" elm
call IMAP('\.', "|> ", 'elm')
call IMAP('\]', "|> ", 'elm')
call IMAP('\/', "|> ", 'elm')
call IMAP('|\', "|> ", 'elm')
call IMAP('|?', "|> ", 'elm')
call IMAP('|.', " => ", 'elm')
call IMAP('|]', "|> ", 'elm')
call IMAP('|/', "|> ", 'elm')
call IMAP('=.', " => ", 'elm')
call IMAP('-.', " ->", 'elm')
call IMAP('-,', " ->", 'elm')
call IMAP('0,', " ->", 'elm')
call IMAP('-0', " ->", 'elm')

