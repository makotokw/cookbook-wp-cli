default[:wp_cli][:user] = 'wp'

default[:wp_cli][:community_packages] = []
default[:wp_cli][:community_packages] << {
  'name' => 'wp-super-cache-cli',
  'repository' => 'git://github.com/wp-cli/wp-super-cache-cli.git',
  'revision' => 'composer',
  'file' => 'cli.php'
  }
