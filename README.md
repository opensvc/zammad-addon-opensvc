# zammad-addon-opensvc

A [Zammad](https://zammad.org) addon that fits OpenSVC needs in product usage.

The changes applied consists of:

* Add a selectable customer priority when customer opens a new ticket
* Add a support contract type to organization

## Development

#### One time setup

1. Run `make init`
   Example:
   ```console
   $ make init
   Give your addon a name. No spaces.
   Addon name?:
   test
   ```
2. `rm -rf .git`
3. `git init`
4. `git add . && git commit -m "Initial commit"`

### Create your addon
1. Edit the files in `src/`

   Migration files should go in `src/db/addon/opensvc` ([see this post](https://community.zammad.org/t/automating-creation-of-custom-object-attributes/3831/2?u=abelxluck))

2. Update version and changelog in `opensvc-skeleton.szpm`
3. Build a new package `make`

   This outputs `dist/opensvc-vXXX.szpm`

4. Install the szpm using the zammad package manager (or populate the auto_install folder at zammad deployment time)

5. Repeat


### Create a new migration

Included is a helper script to create new migrations. You must have the python
`inflection` library installed.

* debian/ubuntu:  `apt install python3-inflection`
* pip: `pip install --user inflection`
* or create your own venv

To make a new migration simply run:
```
make new-migration
```

## License

[![License GNU AGPL v3.0](https://img.shields.io/badge/License-AGPL%203.0-lightgrey.svg)](https://gitlab.com/opensvc/link/zammad-addon-opensvc/blob/master/LICENSE.md)

This is a free software project licensed under the GNU Affero General
Public License v3.0 (GNU AGPLv3) by [OpenSVC SAS](https://www.opensvc.com)

## Credits
This addon was made with [zammad-addon-template](https://gitlab.com/digiresilience/link/zammad-addon-template).
Special thanks to [Abel Luck](https://gitlab.com/abelxluck)
