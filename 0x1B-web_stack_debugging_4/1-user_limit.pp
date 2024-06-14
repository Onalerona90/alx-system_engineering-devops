# Change the OS configuration so that it is possible to login with the holberton user and open a file without any error message

# Define the username for which file limits will be increased
$holberton_user = 'holberton'

# Increase hard file limit for user Holberton
exec { 'increase-hard-file-limit-for-holberton-user':
  command => "sed -i \"/${holberton_user} hard/s/5/50000/\" /etc/security/limits.conf",
  path    => ['/usr/local/bin', '/bin'],
}

# Increase soft file limit for user Holberton
exec { 'increase-soft-file-limit-for-holberton-user':
  command => "sed -i \"/${holberton_user} soft/s/4/50000/\" /etc/security/limits.conf",
  path    => ['/usr/local/bin', '/bin'],
}
