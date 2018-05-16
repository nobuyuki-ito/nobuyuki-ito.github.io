#!/bin/bash
tar zxf community-rules.tar.gz 'community-rules/*.rules'
tar zxf emerging.rules.tar.gz 'rules/*.rules'
tar zxf snortrules-snapshot-29111.tar.gz 'rules/*.rules'

for i in /etc/suricata/rules/*.rules ./community-rules/*.rules ./rules/*.rules; do
	echo " - ${i##*/}"
done > suricata-rules-list.txt

destDir=/etc/suricata/rules
for i in ./rules/*.rules; do
	mv $i $destDir/
done

chown suricata.root /etc/suricata/rules/*.rules
restorecon /etc/suricata/rules/*.rules

rm -rf ./community-rules ./rules

exit 0
