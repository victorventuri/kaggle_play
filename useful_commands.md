# Kaggle API useful commands 

Here, I just talk a bit about some of the useful commands for using the Kaggle Command Line Interface (CLI)

1. `kaggle kernels list --user <username>` will show all of my notebooks
2. `kaggle kernels init -p path/to/directory` will create a `kernel-metadata.json` in that directory with information to be filled out. Once things are ready, it can be submitted back with `kaggle kernels push -p /path/to/kernel`
3. `kaggle kernels pull $KAGGLE_USER/<kernel_name> / -p path/to/directory [-m]` will download the code from a specific kernel; the `-m` flag is technically optional, but required if we will push it back, as we need the metadata file
4. `kaggle kernels output / -p path/to/directory` will download the outputs generated from a kernel run
5. `kaggle kernels status /` checks the status of the kernel: running, complete, failed, etc.
6. `kaggle competitions download -c <competition-name> -p path/to/directory` will download the competitions resources 