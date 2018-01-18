# arch-repo

A set of arch meta pacakges for managing an arch install as well as scripts for
manaing an arch repo.

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
