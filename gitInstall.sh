#!/bin/bash
#git_version=<a version of Git client to use>
git_version=1.9.4
git_sources="/gitz/src/git-${git_version}"
git_bin="/gitz/bin/git-${git_version}"
git_sh="/git-${git_version}.sh"

mkdir -p ${git_sources}
mkdir -p ${git_bin}

wget -O ${git_sources}/git.tar.gz https://www.kernel.org/pub/software/scm/git/git-${git_version}.tar.gz
tar xzf ${git_sources}/git.tar.gz -C ${git_sources}

pushd ${git_sources}/git-${git_version}
make prefix=${git_bin} all && make prefix=${git_bin} install
popd

echo '#!/bin/bash' > ${git_sh}
echo "GIT_EXEC_PATH=${git_bin}/libexec/git-core PATH=${git_bin}/bin:\$PATH GITPERLLIB=${git_bin}/perl/blib/lib ${git_bin}/bin/git \"\$@\"" > ${git_sh}
chmod a+rx ${git_sh}
