class linux_baseline {
 
  class { 'motd':
    content => "This machine is managed by Puppet!/n",
  }
 
  # packages
 
  package { 'openssh-client':
    ensure => '1:6.6p1-2ubuntu2.6',
  }

  package { 'vim':
    ensure => latest,
  }
  
  package { 'openssl':
    ensure => '1.0.1f-1ubuntu2.18',
  }

  # services
  
  service { 'httpd':
    ensure => running,
    enable => true,
  }

  # users

  accounts::user { 'athena':
    uid      => '4001',
    gid      => '4001',
    shell    => '/bin/bash',
    password => 'password123',
    locked   => false,
  }


}
