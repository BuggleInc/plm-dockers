docker build --build-arg "BRANCH=rebase-refactor" --build-arg "REPOSITORY=github.com/BuggleInc/webplm.git" -t play-webplm github.com/BuggleInc/plm-dockers.git#update:play

docker run -v ~/.ivy2:/root/.ivy2 -v `pwd`/target:/app/target play-webplm stage

docker build -t webplm:2.0-rc2 .
