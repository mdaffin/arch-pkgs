# Arch Linux Repository

A set of meta-packages and tooling for managing Arch Linux installs via a custom
repository.

`pkg/mdaffin` contains the meta-packages for my systems and do not strictly
follow the Arch Linux packaging guidelines. Instead, I designed the packages
for easy maintenance. I will sometimes change the contents of the meta-packages
to suite my requirements, as such they are not suitable for general use.
Instead use them as a base for creating your own meta-packages.

The `installer` directory contains installers for my different system with
`installer/install-arch` containing the general purpose installer. Use this as
a base for creating your own. You can install them from a normal Arch Linux ISO
with curl and bash such as (using short URL via git.io):

**WARNING** This will wipe a drive and install Arch Linux on it. **DO NOT** run
unless you have read through it first.

```bash
curl -sL https://git.io/vAoV8 | bash
```

For more details see these blog posts:

- **Part 1:** [Hosting an Arch Linux Repository in an Amazon S3 Bucket]
- **Part 2:** [Managing Arch Linux with Meta Packages]
- **Part 3:** [Creating a Custom Arch Linux Installer]

[hosting an arch linux repository in an amazon s3 bucket]: https://disconnected.systems/blog/archlinux-repo-in-aws-bucket
[managing arch linux with meta packages]: https://disconnected.systems/blog/archlinux-meta-packages
[creating a custom arch linux installer]: https://disconnected.systems/blog/archlinux-installer

## Requirements

- A bucket/space on [Amazon S3] or [Digital Ocean]
- The packages `s3cmd` and `devtools`

A token from Amazon S3 or Digital Ocean spaces in `~/.s3cfg` as

```ini
[default]
access_key = <Access Key>
secret_key = <Secret Key>
```

[amazon s3]: https://aws.amazon.com/s3/
[digital ocean]: https://m.do.co/c/8fba3fc95fef

## Build all packages

Builds all local packages in `pkg/` and uploads them to the remote repository.

```bash
./bin/build
```

You can build one or more packages rather then all packages by specifying the
path to each package.

```bash
./bin/build pkg/mdaffin-{base,devel}
```

## Managing AUR Packages

Use the `aursync` wrapper script to add/update packages from AUR.

```bash
# build and install one or more packages
./bin/sync <packages>

# update all aur packages
./bin/sync -u
```

## Removing a Package

To remove a package from the repository run the following.

```bash
./bin/remove <package>
```
