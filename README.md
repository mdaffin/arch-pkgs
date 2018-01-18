# arch-repo

A set of packages and tools for managing arch linux install via a custom repo.

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
curl -sL https://goo.gl/ks8frs | bash
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

## Manually manage the repo

This mounts the remote repo then spawns a shell to manage it. Once you exit the
shell the remote remote gets unmounted.

```bash
./bin/shell
```

Once in the shell above you can build aur packages with aurutils.

```bash
# Search aur for a package
aursearch <pattern>

# Install/update one or more packages
aursync --repo mdaffin --root $REPO/x86_64 <package>

# Update all packages from aur
aursync --repo mdaffin --root $REPO/x86_64 -u
```

Once you are done type `exit` or press CTRL+D to exit the subshell and unmount
the remote repo (this is done automatically).
