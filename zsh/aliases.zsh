alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command
function checkremote {
    userName=`git config --global --get user.name`
    echo 'Listing remote branch deletion commands for: '$userName
    count=0
    git remote prune origin
    for branch in `git branch -r | grep -v HEAD`;
        do 
            currentAuthor=`git show --format="%an" $branch | head -n 1` 
            if [ $currentAuthor = $userName ]; then
                if [ $branch != 'develop' -a $branch != 'master' ]; then
                    echo 'git push origin :'${branch:7}
                    count=$count + 1
                fi
            fi
        done
    echo $count' remotes found at origin'
};
function log {
    exec 3>&1
    BROWN='\033[0;33'
    NC='\033[0m'
    echo "${BROWN}$1${NC}"
};
alias interim="git add . && git add -u && git commit -m 'interim branch commit'"
alias ber="killall -9 ruby || rvm 1.9.3 && bundle exec rake clean && bundle exec rake clean && bundle exec rackup"
alias dev="git checkout develop && git pull"
alias mas="git checkout master && git pull"
alias cleanlocal="git branch | grep -v '^* master$' | grep -v '^  master$' | grep -v '^* develop$' | xargs git branch -D"
alias bs="broccoli serve"
alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias unfuckbabel="cd node_modules/ember-cli-babel/; npm i broccoli-babel-transpiler@5.0.0; cd -;"
alias reint='rm -rf node_modules && rm -rf ngam-addon/node_modules && rm -rf bower_components && rm -rf tmp; npm cache clean && bower cache clean; npm install && bower install'
function resetstate {
    log "removing artifacts simulating a fresh clone..."
    git clean -d -x -f
    log "threaded npm installing in the base of repo..."
    npm install &
    cd $2
    log "threaded npm installing in $1 directory"
    npm install &
    log "threaded bower install in $1 directory"
    bower install || echo 'no bower json' &
    wait
    log "complete"
}
alias freshClone="git clean -d -x -f && npm install"
alias open422="sub ~/dev/q2fe/ngam_422"