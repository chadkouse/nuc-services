# =======================================
# Storage prep to "/mnt" drive (~500 GB+)
# =======================================
MNT_DIR="/home/chadkouse/storage/k3s"
K3S_VERSION="v1.33.0+k3s1"

# nodefs
#
KUBELET_DIR="${MNT_DIR}/kubelet"
sudo mkdir -p "${KUBELET_DIR}"

# imagefs: containerd has a root and state directory
#
# - https://github.com/containerd/containerd/blob/main/docs/ops.md#base-configuration
#
# containerd root -> /var/lib/rancher/k3s/agent/containerd
#
CONTAINERD_ROOT_DIR_OLD="/var/lib/rancher/k3s/agent"
CONTAINERD_ROOT_DIR_NEW="${MNT_DIR}/containerd-root/containerd"
sudo mkdir -p "${CONTAINERD_ROOT_DIR_OLD}"
sudo mkdir -p "${CONTAINERD_ROOT_DIR_NEW}"
sudo ln -s "${CONTAINERD_ROOT_DIR_NEW}" "${CONTAINERD_ROOT_DIR_OLD}"

# containerd state -> /run/k3s/containerd
#
CONTAINERD_STATE_DIR_OLD="/run/k3s"
CONTAINERD_STATE_DIR_NEW="${MNT_DIR}/containerd-state/containerd"
sudo mkdir -p "${CONTAINERD_STATE_DIR_OLD}"
sudo mkdir -p "${CONTAINERD_STATE_DIR_NEW}"
sudo ln -s "${CONTAINERD_STATE_DIR_NEW}" "${CONTAINERD_STATE_DIR_OLD}"

# pvs -> /var/lib/rancher/k3s/storage
#
PV_DIR_OLD="/var/lib/rancher/k3s"
PV_DIR_NEW="${MNT_DIR}/local-path-provisioner/storage"
sudo mkdir -p "${PV_DIR_OLD}"
sudo mkdir -p "${PV_DIR_NEW}"
sudo ln -s "${PV_DIR_NEW}" "${PV_DIR_OLD}"

# =======
# Install
# =======
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="$K3S_VERSION" INSTALL_K3S_EXEC="--kubelet-arg "root-dir=$KUBELET_DIR"" sh -
sudo chmod 644 /etc/rancher/k3s/k3s.yaml