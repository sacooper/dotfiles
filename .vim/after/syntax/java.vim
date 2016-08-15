set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set makeprg=ant\ -find\ build.xml

let g:syntastic_java_javac_classpath="/home/scott/Dropbox/Programming/McGill/COMP424/Project/bin"

