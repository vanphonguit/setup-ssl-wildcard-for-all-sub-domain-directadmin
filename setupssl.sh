mkdir /root/backupssl/

for i in `ls /usr/local/directadmin/data/users`; do
{
 for d in `cat /usr/local/directadmin/data/users/${i}/domains.list`; do

 {

if [[ "$d" =~ ^(.+\.)?mydomain\.com\.vn$ ]]; then

cd  /usr/local/directadmin/data/users/$i/domains/



echo "$i --- $d"
cat /usr/local/directadmin/data/users/$i/domains/$d.cacert > /root/backupssl/$d.cacert
cat /usr/local/directadmin/data/users/$i/domains/$d.cert > /root/backupssl/$d.cert
cat /usr/local/directadmin/data/users/$i/domains/$d.cert.combined > /root/backupssl/$d.cert.combined
cat /usr/local/directadmin/data/users/$i/domains/$d.key > /root/backupssl/$d.key
echo "*********************"


cat  /root/ssl/ca.cer > /usr/local/directadmin/data/users/$i/domains/$d.cacert
cat /root/ssl/mydomain.com.vn.cer  > /usr/local/directadmin/data/users/$i/domains/$d.cert
cat  /root/ssl/mydomain.com.vn.cer  > /usr/local/directadmin/data/users/$i/domains/$d.cert.combined
cat  /root/ssl/ca.cer  >> /usr/local/directadmin/data/users/$i/domains/$d.cert.combined
cat  /root/ssl/mydomain.com.vn.key > /usr/local/directadmin/data/users/$i/domains/$d.key

fi


#sleep 1


 };
 done;
};
done

cd /usr/local/directadmin/custombuild
./build rewrite_confs

