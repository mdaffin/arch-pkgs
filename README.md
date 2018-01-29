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
curl -sL https://goo.gl/Ehu5K9 | bash
```

**WARNING** the above will wipe a drive and install arch on it. **DO NOT** run
unless you have read through it first.

## Requirements

* A bucket/space on [amazon s3] or [digital ocean]
* The packages `s3fs-fuse` and `devtools`

A token from amazon s3 or digital ocean spaces in `~/.passwd-s3fs` as
'bucketName:accessKeyId:secretAccessKey'

[amazon s3]: https://aws.amazon.com/s3/
[digital ocean]: https://m.do.co/c/8fba3fc95fef

## Build all packages

Builds all local packages in `pkg/` and uploads them to the remote repo.

```bash
./bin/build
```

## Managing AUR Packages

Use the `aursync` wrapper script to add/update packages from AUR.

```bash
# build and install one or more packages
./bin/aursync <packages>

# update all aur packages
./bin/aursync -u 
```

## Manually manage the repo

This mounts the remote repo then spawns a shell to manage it. Once you exit the
shell the remote remote gets unmounted.

```bash
./bin/shell
```

Once in the shell above the repo will be mounted at `$REPO`. When you are done type `exit` or press CTRL+D to exit the subshell this will automatically unmount the remote repo.
