wp-cli Cookbook
==================
This cookbook set up [WP-CLI](http://wp-cli.org/)

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

Attributes
----------

#### wp-cli::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><code>['wp-cli']['path']</code></td>
    <td>String</td>
    <td>Install path</td>
    <td><code>'/usr/local/bin/wp'</code></td>
  </tr>
  <tr>
    <td><code>['wp-cli']['user']['name']</code></td>
    <td>String</td>
    <td>User to configure ``~/.wp-cli``</td>
    <td><code>'wp'</code></td>
  </tr>
  <tr>
    <td><code>['wp-cli']['community_packages']</code></td>
    <td>Array</td>
    <td>Community Packages to install. Name, git URL, directory path, or .zip file</td>
    <td></td>
  </tr>
</table>

Usage
-----
#### wp-cli::default

Just include `wp-cli` in your node's `run_list`:

```json
{
  "name":"my_node",
  "wp_cli": {
    "user": {
      "name": "username"
    },
    "community_packages": [
      "wp-cli/server-command:@stable",
      "git@github.com:runcommand/hook.git",
      "google-sitemap-generator-cli.zip"
    ]
  },
  "run_list": [
    "recipe[wp-cli]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Makoto Kawasaki
