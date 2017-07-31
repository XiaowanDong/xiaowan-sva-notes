for i in $(seq 1 5)
do 
ssh  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p 22 root@192.5.53.64  cat /vg/VgEval/exprScripts/files/file-1 # 2&>1 /dev/null
done
