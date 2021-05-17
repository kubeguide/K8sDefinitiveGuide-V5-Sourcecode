yum install -y kubeadm-1.14.0 --disableexcludes=kubernetes

kubeadm upgrade plan

kubeadm upgrade apply 1.14.0

kubeadm upgrade node config --kubelet-version 1.14.0
