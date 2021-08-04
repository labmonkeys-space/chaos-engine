source "vsphere-iso" "vsphere" {
  CPUs = var.vm-cpu-num
  RAM = var.vm-mem-size
  RAM_reserve_all = false
  boot_command = ["e<down><down><end><bs><bs><bs><bs><bs>text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait = "5s"
  cluster = var.cluster
  datacenter = var.datacenter
  datastore = var.datastore
  disk_controller_type = ["pvscsi"]
  firmware = "efi"
  folder = var.folder
  guest_os_type = "centos8_64Guest"
  http_directory = "http"
  insecure_connection = "true"
  iso_checksum = "sha256:36220be996c146263c5d045f2aa194f2f76d8094959819f93debc382a66c761e"
  iso_url = "https://mirror.informatik.hs-fulda.de/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-20210721-boot.iso"
  network_adapters {
    network = var.network
    network_card = "vmxnet3"
  }
  notes = "Benchmark lab environment"
  password = var.vsphere-password
  shutdown_command = "echo 'packer'|sudo -S /sbin/halt -h -p"
  ssh_password = var.ssh-password
  ssh_username = var.ssh-username
  storage {
    disk_size = var.vm-disk-size
    disk_thin_provisioned = true
  }
  username = var.vsphere-user
  vcenter_server = var.vsphere-server
  vm_name = var.vm-name
}

build {
  sources = ["source.vsphere-iso.vsphere"]

  provisioner "shell" {
    scripts = [
      "scripts/prepare.sh"]
  }
}
