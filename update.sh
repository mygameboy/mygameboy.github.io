#!/bin/bash

cd ~/src/html/mygameboy;
ping -A -D -c 20 -v 8.8.8.8 > ping.txt;
date > README.md;
git add .;
git commit -m "add timestamp";

echo ''  >> README.md 2>&1;
echo 'This project is live at [https://mygameboy.github.io](https://mygameboy.github.io "my gameboy") thanks to Github.'  >> README.md 2>&1;
echo ''  >> README.md 2>&1;

echo "\`\`\`bash"  >> README.md 2>&1;
ping -A -D -c 20 -v 8.8.8.8 >> ping.txt 2>&1;
git add .;
git commit -m "begin add system status";
echo "System Memory"  >> README.md 2>&1;
free -h  >> README.md 2>&1;
echo "System Storage"  >> README.md 2>&1;
du -sh . >> README.md 2>&1;
git add .;
git commit -m "add system status";
echo "\`\`\`"  >> README.md 2>&1;
git add .;
git commit -m "end add system status";

echo "\`\`\`bash"  >> README.md 2>&1;
ping -A -D -c 20 -v 8.8.8.8 >> ping.txt 2>&1;
git add .;
git commit -m "begin update node";
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh;  # This loads NVM
source ~/.nvm/nvm.sh >> README.md 2>&1;
time nvm install --lts >> README.md 2>&1;
time nvm use --lts >> README.md 2>&1;
time yarn >> README.md 2>&1;
echo "\`\`\`"  >> README.md 2>&1;
ping -A -D -c 20 -v 8.8.8.8 >> ping.txt 2>&1;
git add .;
git commit -m "end update node";

git add .;
git commit -m "begin yarn";
time yarn;
git add .;
git commit -m "end yarn";

echo "\`\`\`bash" >> README.md 2>&1;
time npx browserslist --update-db >> README.md 2>&1;
echo "\`\`\`" >> README.md 2>&1;

echo "\`\`\`bash"  >> README.md 2>&1;
ping -A -D -c 20 -v 8.8.8.8 >> ping.txt 2>&1;
git add .;
git commit -m "begin build";
time yarn run vite build
git add .;
git commit -m "end build";

date  >> README.md 2>&1;
ping -D -c 20 -v 8.8.8.8 >> ping.txt 2>&1;
time yarn version --patch  >> README.md 2>&1;
git add .;
git commit -m "add timestamp";
git pull --rebase origin master --strategy-option=ours;
git add .;
git commit -m "merge from remote";
git push origin master;
