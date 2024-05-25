echo "#!/bin/sh"
echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list
apt update -y
apt install -y g++-11 screen nano libc6 htop
# shellcheck disable=SC2164
cd ~

wget https://github.com/rigelminer/rigel/releases/download/1.17.2/rigel-1.17.2-linux.tar.gz

tar -xzvf qli-Client-1.9.6-Linux-x64.tar.gz
tar -xzvf lolMiner_v1.88_Lin64.tar.gz
tar -xzvf rigel-1.17.2-linux.tar.gz

echo "#xelis" >> /root/mine.sh
echo "/root/rigel-1.17.2-linux/rigel -a xelishash+zil -o [1]stratum+ssl://eu.xel.k1pool.com:9352 -u [1]KrQdDzjnGRbnLQQmYGQv9EUxPPuMzBqfCso -o [2]stratum+tcp://eu.zil.k1pool.com:1111 -u [2]KrQdDzjnGRbnLQQmYGQv9EUxPPuMzBqfCso --zil-countdown -w $1" >> /root/mine.sh


# shellcheck disable=SC2129
echo "" >> /etc/supervisor/conf.d/supervisord.conf
echo "[program:mining]" >> /etc/supervisor/conf.d/supervisord.conf
echo "command=/bin/bash -c 'screen -dmS mining bash /root/mine.sh $1 && sleep infinity'" >> /etc/supervisor/conf.d/supervisord.conf
