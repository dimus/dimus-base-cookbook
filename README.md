dimus-base Cookbook
===================
This cookbook creates basic environment for server or workstation with my usual
bells and whistles

[![Cookbook version]][1][2]
[![Continuous Integration Status][3]][4]


Requirements
------------
It will eventually support ubuntu, centos and darwin

#### operating systems
Ubuntu, CenOS, OS X

#### packages
- `git` - for version control

#### cookbooks
- build essentials
- git
- vim


Attributes
----------
#### dimus-base::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['dimus-base']['boxtype']</tt></td>
    <td>String</td>
    <td>Chooses dfferent packages for laptop, desktop or server</td>
    <td><tt>server</tt></td>
  </tr>
  <tr>
    <td><tt>['dimus-base']['users']</tt></td>
    <td>Array</td>
    <td>List of users to setup as 'dimus'</td>
    <td><tt>dimus</tt></td>
  </tr>
</table>

Usage
-----
#### dimus-base::default
Just include `dimus-base` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dimus-base]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Dmitry Mozzherin

[1]: http://img.shields.io/cookbook/v/dimus/dimus-base-cookbook.svg
[2]: https://github.com/dimus/dimus-base-cookbook
[3]: http://img.shields.io/travis/dimus/dimus-base-cookbook.svg
[4]: http://travis-ci.org/dimus/dimus-base-cookbook
