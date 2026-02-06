# Kaggle API useful commands 

Here, I just talk a bit about some of the useful commands for using the Kaggle Command Line Interface (CLI)

1. `kaggle kernels list --user <username>` will show all of my notebooks
2. `kaggle kernels init -p path/to/directory` will create a `kernel-metadata.json` in that directory with information to be filled out. Once things are ready, it can be submitted back with `kaggle kernels push -p /path/to/kernel`