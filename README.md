# Arch Repo

A set of packages and tools for managing arch linux install via a custom repo.

The idea is to manage a set of archlinux boxes with custom meta packages that
install/configure sets of packages as well as to build/maintain aur packages.

For example `mdaffin-base` will install packages that I always install on both
servers and desktops. And `mdaffin-desktop` will install/configure i3, sddm and
a bunch of useful applcations that I use on all of my systems.

A repo is maintained in a amazon s3 bucket or digital ocean space with packages
built from aur as well as some custom local packages stored in `pkg/`. The
packages in `pkg/` are meta/config packages disigned to make it easier to
install an arch system the way I like and to help keep multiple systems
uptodate/insync.

I do not expect anyone to use this repo directly, but feel free to clone it,
create a repo of your own and start customising it to your liking.

There is an installer script in `installer/install-arch` that will bootstrap
new system with this repo that only requires the arch live usb and this
command:

```bash
curl -sL https://git.io/vAoV8 | bash
```

**WARNING** the above will wipe a drive and install arch on it. **DO NOT** run
unless you have read through it first.

For more details see these blog posts:

- **Part 1:** [Hosting an Arch Linux Repo in an Amazon S3 Bucket]
- **Part 2:** [Managing Arch Linux with Meta Packages]
- **Part 3:** [Creating a Custom Arch Linux Installer]

[Hosting an Arch Linux Repo in an Amazon S3 Bucket]: https://disconnected.systems/blog/archlinux-repo-in-aws-bucket
[Managing Arch Linux with Meta Packages]: https://disconnected.systems/blog/archlinux-meta-packages
[Creating a Custom Arch Linux Installer]: https://disconnected.systems/blog/archlinux-installer

## Requirements

* A bucket/space on [amazon s3] or [digital ocean]
* The packages `s3cmd` and `devtools`

A token from amazon s3 or digital ocean spaces in `~/.s3cfg` as

```ini
[default]
access_key = <Access Key>
secret_key = <Secret Key>
```

[amazon s3]: https://aws.amazon.com/s3/
[digital ocean]: https://m.do.co/c/8fba3fc95fef

## Build all packages

Builds all local packages in `pkg/` and uploads them to the remote repo.

```bash
./bin/build
```

You can build one or more packages rather then all packages be specifiyng the path to each package.

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

Packages can be removed from the repo with the following.

```bash
./bin/remove <package>
```
