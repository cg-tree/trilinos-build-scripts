grep -rl 'mpiexec\" \"-np\"' ../build | xargs sed -i "s/mpiexec\" \"-np\"/mpiexec\" \"--oversubscribe\" \"-n\"/g"
