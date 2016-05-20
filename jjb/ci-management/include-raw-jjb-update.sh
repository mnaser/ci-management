jenkins-jobs update --recursive --delete-old --workers 4 jjb/

# Submit patches for any jobs that can be auto updated
function submitJJB {
    git commit -asm "Update automated project templates"
    git push origin HEAD:refs/for/master
}

gitdir=$(git rev-parse --git-dir); scp -p -P 29418 rotterdam-jobbuilder@gerrit.fd.io:hooks/commit-msg ${gitdir}/hooks/
git diff --exit-code || submitJJB
