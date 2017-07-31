HOST=root@192.5.53.64
PORT=22
DIR=/vg/VgEval/exprScripts/files/
#
# Tranfer files of each size
#
#for ii in $(seq 10 29)
for i in 1024 #2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 16777216 33554432 67108864 134217728 268435456 536870912 
do
    echo "Testing size $i"
    echo "---------------"

    # Remove the existing file
    rm -f ssh.results.$i
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p $PORT -v $HOST cat $DIR/file-$i > /dev/null
    # Run the test appending the output to the file
    for j in {1..20}
    do	
       ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p $PORT -v $HOST cat $DIR/file-$i > /dev/null | tee -a ssh.results.$i
    done
done


