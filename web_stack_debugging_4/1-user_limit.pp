exec { 'change-os-configuration-for-holberton-user':
  command => 'echo "holberton soft nofile 4096\nholberton hard nofile 8192" >> /etc/security/limits.conf &&
              echo "session required pam_limits.so" >> /etc/pam.d/common-session &&
              echo "session required pam_limits.so" >> /etc/pam.d/common-session-noninteractive &&
              echo "ulimit -n 4096" >> /etc/profile',
  path    => ['/bin', '/usr/bin'],
}
