#!/bin/bash
sudo docker exec -it kasm_db psql -U kasmapp -d kasm

update users set
    pw_hash = 'fe519184b60a4ef9b93664a831502578499554338fd4500926996ca78fc7f522',
    salt = '83d0947a-bf55-4bec-893b-63aed487a05e',
    secret=NULL, set_two_factor=False, locked=False,
    disabled=False, failed_pw_attempts = 0 where username ='admin@kasm.local';
DELETE FROM webauthn_credentials WHERE user_id IN ( SELECT user_id FROM users WHERE username = 'admin@kasm.local' );
\q
