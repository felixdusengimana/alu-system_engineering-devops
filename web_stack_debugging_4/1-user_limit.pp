# This Puppet manifest adjusts the OS configuration to increase the file descriptor limits for the holberton user.

exec { 'increase-file-descriptor-limits':
  command => 'echo "holberton soft nofile 4096\nholberton hard nofile 8192" >> /etc/security/limits.conf &&
              echo "session required pam_limits.so" >> /etc/pam.d/common-session &&
              echo "session required pam_limits.so" >> /etc/pam.d/common-session-noninteractive &&
              echo "ulimit -n 4096" >> /etc/profile',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep -q "holberton soft nofile 4096" /etc/security/limits.conf &&
              grep -q "holberton hard nofile 8192" /etc/security/limits.conf &&
              grep -q "session required pam_limits.so" /etc/pam.d/common-session &&
              grep -q "session required pam_limits.so" /etc/pam.d/common-session-noninteractive &&
              grep -q "ulimit -n 4096" /etc/profile',
}
