class linux_baseline {
 
  class { 'motd':
    content => "This machine is managed by Puppet!/n",
  }
 
  # packages
 
  package { 'openssh':
    ensure => present,
  }

  package { 'vim':
    ensure => latest,
  }
  
  package { 'openissl':
    ensure => '1.0.1f-1ubuntu2.18',
  }

  # services
  
  service { 'httpd':
    ensure => running,
    enable => true,
  }

  # users

  accounts::user { 'athena':
    uid      => 4001,
    gid      => 4001,
    shell    => '/bin/bash',
    password => 'password123',
    sshkeys  => "ssh-rsa AAAA...",
    locked   => false,
  }


}
