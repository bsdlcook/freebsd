set -l packages (pkg search -og \* | awk '{print $1}')

complete -x -c pinstall -a "$packages"
complete -x -c pinstall -s s -l source -d "Install package from source"
