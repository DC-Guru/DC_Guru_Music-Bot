echo "Please run this code on repl.it server"
echo "(1/4) Downloading Node js LTS..."
wget -O node-v14.17.0-linux-x64.tar.xz https://nodejs.org/download/release/latest-v14.x/node-v14.17.0-linux-x64.tar.xz > /dev/null 2>&1
echo "(2/4) Verifing Node js LTS SHA256..."
curl -O https://nodejs.org/dist/latest-v14.x/SHASUMS256.txt > /dev/null 2>&1
grep node-v14.17.0-linux-x64.tar.xz SHASUMS256.txt | sha256sum -c - > /dev/null 2>&1
[ "$?" != "0" ] && echo "Cannot verify Node js source code, please retry later!" && exit 1
echo "(3/4) Decompressing Node js LTS tar..."
tar -xf node-v14.17.0-linux-x64.tar.xz > /dev/null 2>&1
rm -rf SHASUMS256.txt > /dev/null 2>&1
rm -rf node-v14.17.0-linux-x64.tar.xz > /dev/null 2>&1
echo "(4/4) Installing Node js LTS..."
if [ -d "node-bin" ]
then
  read -p "Looks like there is a folder named node-bin, overwrite it?(y/n) " overwrite
  if [ "$overwrite" == "y" ]
  then
    echo "(4/4) Removing folder node-bin"
    rm -rf node-bin
  else
    echo "Aborted"
    exit 1
  fi
fi
mv -f node-v14.17.0-linux-x64 node-bin
export NODEJS_HOME=home/runner/$REPL_SLUG/node-bin
export PATH=$PATH:$NODEJS_HOME/bin
echo
echo "Done!"
