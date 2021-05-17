yum install kubelet kubeadm --disableexcludes=kubernetes

systemctl start kubelet
systemctl enable kubelet

kubeadm join 192.168.18.10:6443 --token 2m54ly.s8g4lv2urk0dcuvi \
    --discovery-token-ca-cert-hash sha256:159400c88042d63dc7188db587c81efd1282d4bb16f00d316120ebcd278a333f

kubeadm config print join-defaults > join.config.yaml




join.config.yaml的内容如下：

apiVersion: kubeadm.k8s.io/v1beta2
kind: JoinConfiguration
discovery:
  bootstrapToken:
    apiServerEndpoint: 192.168.18.10:6443
    token: 2m54ly.s8g4lv2urk0dcuvi
    unsafeSkipCAVerification: true
  tlsBootstrapToken: 2m54ly.s8g4lv2urk0dcuvi

kubeadm join --config=join.config.yaml


kubectl get nodes

kubectl taint nodes --all node-role.kubernetes.io/master-
