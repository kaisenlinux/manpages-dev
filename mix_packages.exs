defmodule KaisenManpages.MixProject do
  use Mix.Project

  def project do
    [
      app: :kaisen_manpages,
      version: "1.6.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Manpages",
      homepage_url: "https://kaisenlinux.org/manpages/",
      authors: "Arnaud Cormier & Kevin Chevreuil",
      docs: [
         main: "readme",
         source_ref: "sort A-Z",
         api_reference: false,
         logo: "priv/assets/kaisen-logo.jpg",
         assets: "priv/assets",
         before_closing_head_tag: &docs_before_closing_head_tag/1,
         formatters: ["html"],
         extra_section: "MANUALS",
 	 javascript_config_path: "doc-versions.js",
    output: "doc/packages",
         extras: [
          "packages/README.md", [ title: "Manpages by packages"],
          "packages/2ping.md",
          "packages/7z.md",
          "packages/ansible-config.md",
          "packages/ansible-console.md",
          "packages/ansible-doc.md",
          "packages/ansible-galaxy.md",
          "packages/ansible-inventory.md",
          "packages/ansible.md",
          "packages/ansible-playbook.md",
          "packages/ansible-pull.md",
          "packages/ansible-vault.md",
          "packages/apg.md",
          "packages/archivemount.md",
          "packages/arpalert.md",
          "packages/arping.md",
          "packages/arp.md",
          "packages/arptables.md",
          "packages/arpwatch.md",
          "packages/atftp.md",
          "packages/automysqlbackup.md",
          "packages/autopostgresqlbackup.md",
          "packages/backup2l.md",
          "packages/badblocks.md",
          "packages/baobab.md",
          "packages/bat.md",
          "packages/bdeinfo.md",
          "packages/bdemount.md",
          "packages/bleachbit.md",
          "packages/bruteforce-luks.md",
          "packages/btrfs-balance-least-used.md",
          "packages/btrfsck.md",
          "packages/btrfs-find-root.md",
          "packages/btrfs-heatmap.md",
          "packages/btrfs-image.md",
          "packages/btrfs-map-logical.md",
          "packages/btrfs.md",
          "packages/btrfs-orphan-cleaner-progress.md",
          "packages/btrfs-select-super.md",
          "packages/btrfs-space-calculator.md",
          "packages/btrfstune.md",
          "packages/btrfs-usage-report.md",
          "packages/cabextract.md",
          "packages/cbm.md",
          "packages/cdpr.md",
          "packages/ceph-fuse.md",
          "packages/chkrootkit.md",
          "packages/chntpw.md",
          "packages/clamtk.md",
          "packages/clusterssh.md",
          "packages/cmospwd.md",
          "packages/comgt.md",
          "packages/cpulimit.md",
          "packages/crack.md",
          "packages/crunch.md",
          "packages/ctop.md",
          "packages/cu.md",
          "packages/cups.md",
          "packages/curl.md",
          "packages/dcfldd.md",
          "packages/dd.md",
          "packages/ddrescueview.md",
          "packages/ddrutility.md",
          "packages/df.md",
          "packages/dhclient.md",
          "packages/dhcpdump.md",
          "packages/dhcping.md",
          "packages/dig.md",
          "packages/di.md",
          "packages/dirvish.md",
          "packages/discover.md",
          "packages/diskscan.md",
          "packages/disktype.md",
          "packages/dislocker.md",
          "packages/dmidecode.md",
          "packages/dnsenum.md",
          "packages/dnstop.md",
          "packages/docker.md",
          "packages/driftnet.md",
          "packages/dsniff.md",
          "packages/dstat.md",
          "packages/du.md",
          "packages/dump.md",
          "packages/duplicity.md",
          "packages/duply.md",
          "packages/dynamips.md",
          "packages/etherape.md",
          "packages/ethstatus.md",
          "packages/ethtool.md",
          "packages/ettercap.md",
          "packages/exfatfsck.md",
          "packages/ext4magic.md",
          "packages/extundelete.md",
          "packages/f2fscrypt.md",
          "packages/fatresize.md",
          "packages/fcrackzipinfo.md",
          "packages/fcrackzip.md",
          "packages/fdisk.md",
          "packages/file.md",
          "packages/filezilla.md",
          "packages/fio.md",
          "packages/flashrom.md",
          "packages/foremost.md",
          "packages/fsarchiver.md",
          "packages/fsck.md",
          "packages/fstrim.md",
          "packages/fuseiso.md",
          "packages/fusesmb.md",
          "packages/fuse-zip.md",
          "packages/fvdeinfo.md",
          "packages/fvdemount.md",
          "packages/gdisk.md",
          "packages/gfs2_lockcapture.md",
          "packages/gftp.md",
          "packages/git-repair.md",
          "packages/glusterfind.md",
          "packages/glusterfsd.md",
          "packages/glusterfs.md",
          "packages/gluster-georep-sshkey.md",
          "packages/gluster-mountbroker.md",
          "packages/gluster-setgfid2path.md",
          "packages/gparted.md",
          "packages/gpart.md",
          "packages/gpg.md",
          "packages/grsync.md",
          "packages/gsmartcontrol.md",
          "packages/gtkhash.md",
          "packages/guymager.md",
          "packages/hardinfo.md",
          "packages/hashcat.md",
          "packages/hddtemp.md",
          "packages/hdparm.md",
          "packages/hexedit.md",
          "packages/hostapd.md",
          "packages/hping3.md",
          "packages/htop.md",
          "packages/hwinfo.md",
          "packages/hw-probe.md",
          "packages/hydra.md",
          "packages/ifconfig.md",
          "packages/ifstat.md",
          "packages/iftop.md",
          "packages/img2pdf.md",
          "packages/ioping.md",
          "packages/iotop.md",
          "packages/iozone.md",
          "packages/ipcalc.md",
          "packages/iperf3.md",
          "packages/iperf.md",
          "packages/iptables.md",
          "packages/iptraf.md",
          "packages/iptstate.md",
          "packages/ipv6calc.md",
          "packages/irqbalance.md",
          "packages/iw.md",
          "packages/jfs_debugfs.md",
          "packages/jfs_fscklog.md",
          "packages/jfs_fsck.md",
          "packages/jfs_logdump.md",
          "packages/jfs_mkfs.md",
          "packages/jfs_tune.md",
          "packages/jmeter.md",
          "packages/john.md",
          "packages/keepassxc.md",
          "packages/kismet.md",
          "packages/kubectl.md",
          "packages/lft.md",
          "packages/lftp.md",
          "packages/lockfile-create.md",
          "packages/lockfile-remove.md",
          "packages/lockfile-touch.md",
          "packages/logrotate.md",
          "packages/lshw-gtk.md",
          "packages/lshw.md",
          "packages/lsof.md",
          "packages/lspci.md",
          "packages/lxc-attach.md",
          "packages/lxc-autostart.md",
          "packages/lxc-cgroup.md",
          "packages/lxc-checkconfig.md",
          "packages/lxc-checkpoint.md",
          "packages/lxc-config.md",
          "packages/lxc-console.md",
          "packages/lxc-copy.md",
          "packages/lxc-create.md",
          "packages/lxc-destroy.md",
          "packages/lxc-device.md",
          "packages/lxc-execute.md",
          "packages/lxc-freeze.md",
          "packages/lxcfs.md",
          "packages/lxc-info.md",
          "packages/lxc-ls.md",
          "packages/lxc-monitor.md",
          "packages/lxc-snapshot.md",
          "packages/lxc-start.md",
          "packages/lxc-stop.md",
          "packages/lxctl.md",
          "packages/lxc-unfreeze.md",
          "packages/lxc-unshare.md",
          "packages/lxc-update-config.md",
          "packages/lxc-usernsexec.md",
          "packages/lxc-wait.md",
          "packages/lzop.md",
          "packages/macchanger.md",
          "packages/magicrescue.md",
          "packages/masscan.md",
          "packages/mcedit.md",
          "packages/mc.md",
          "packages/mdns-scan.md",
          "packages/memstat.md",
          "packages/memtester.md",
          "packages/minicom.md",
          "packages/mkreiser4.md",
          "packages/mlocate.md",
          "packages/mount.md",
          "packages/myrescue.md",
          "packages/nast.md",
          "packages/ncdu.md",
          "packages/nc.md",
          "packages/ndisc6.md",
          "packages/netdiscover.md",
          "packages/nethogs.md",
          "packages/netperfmeter.md",
          "packages/netsed.md",
          "packages/netsniff-ng.md",
          "packages/netstat.md",
          "packages/ngrep.md",
          "packages/nilfs_cleanerd.md",
          "packages/nilfs-clean.md",
          "packages/nilfs-resize.md",
          "packages/nilfs-tune.md",
          "packages/nmap.md",
          "packages/nslookup.md",
          "packages/ntfs-3g.md",
          "packages/ntfscat.md",
          "packages/ntfsclone.md",
          "packages/ntfscluster.md",
          "packages/ntfscmp.md",
          "packages/ntfscp.md",
          "packages/ntfsdecrypt.md",
          "packages/ntfsfallocate.md",
          "packages/ntfsfix.md",
          "packages/ntfsinfo.md",
          "packages/ntfslabel.md",
          "packages/ntfsls.md",
          "packages/ntfsrecover.md",
          "packages/ntfsresize.md",
          "packages/ntfssecaudit.md",
          "packages/ntfstruncate.md",
          "packages/ntfsundelete.md",
          "packages/ntfsusermap.md",
          "packages/ntfswipe.md",
          "packages/ntpdate.md",
          "packages/nwipe.md",
          "packages/ocfs2_hb_ctl.md",
          "packages/openvpn.md",
          "packages/ophcrack-cli.md",
          "packages/ophcrack.md",
          "packages/packer.md",
          "packages/packeth.md",
          "packages/packetsender.md",
          "packages/partclone.md",
          "packages/parted.md",
          "packages/partimage.md",
          "packages/pcapfix.md",
          "packages/pdfcrack.md",
          "packages/pffexport.md",
          "packages/pffinfo.md",
          "packages/photorec.md",
          "packages/picocom.md",
          "packages/pigz.md",
          "packages/progress.md",
          "packages/psensor.md",
          "packages/pst2dii.md",
          "packages/pst2ldif.md",
          "packages/pstree.md",
          "packages/puppet.md",
          "packages/pv.md",
          "packages/pwgen.md",
          "packages/qtop.md",
          "packages/rdfind.md",
          "packages/recoverdm.md",
          "packages/recoverjpeg.md",
          "packages/reiserfsck.md",
          "packages/reiserfstune.md",
          "packages/remmina-gnome.md",
          "packages/remmina.md",
          "packages/rephrase.md",
          "packages/restic.md",
          "packages/rfkill.md",
          "packages/rkhunter.md",
          "packages/rsbackup.md",
          "packages/rsync.md",
          "packages/safecopy.md",
          "packages/samdump2.md",
          "packages/scalpel.md",
          "packages/scapy.md",
          "packages/scp.md",
          "packages/screen.md",
          "packages/scrub.md",
          "packages/sdmem.md",
          "packages/sensors-detect.md",
          "packages/setserial.md",
          "packages/sfill.md",
          "packages/shred.md",
          "packages/sipcalc.md",
          "packages/smartctl.md",
          "packages/socat.md",
          "packages/sockstat.md",
          "packages/squashfuse.md",
          "packages/srm.md",
          "packages/sshfs.md",
          "packages/ssldump.md",
          "packages/sslscan.md",
          "packages/sslsniff.md",
          "packages/sslsplit.md",
          "packages/ssmping.md",
          "packages/sswap.md",
          "packages/statserial.md",
          "packages/strace.md",
          "packages/stressant.md",
          "packages/stress.md",
          "packages/tcpbridge.md",
          "packages/tcpdump.md",
          "packages/tcpflow.md",
          "packages/tcpreplay.md",
          "packages/tcpstat.md",
          "packages/tcptrace.md",
          "packages/tcptraceroute.md",
          "packages/tcpxtract.md",
          "packages/telnet.md",
          "packages/testdisk.md",
          "packages/timeshift.md",
          "packages/tmfs.md",
          "packages/tmux.md",
          "packages/tracepath.md",
          "packages/traceroute6.md",
          "packages/traceroute.md",
          "packages/tree.md",
          "packages/tshark.md",
          "packages/udfinfo.md",
          "packages/udflabel.md",
          "packages/umount.md",
          "packages/unp.md",
          "packages/unrar.md",
          "packages/unzip.md",
          "packages/vagrant.md",
          "packages/vbackup.md",
          "packages/vhdiinfo.md",
          "packages/virt-manager.md",
          "packages/virtualbox.md",
          "packages/vmdkinfo.md",
          "packages/vmfs6-fuse.md",
          "packages/vmfs6-lvm.md",
          "packages/vmfs-fuse.md",
          "packages/vmfs-lvm.md",
          "packages/vpcs.md",
          "packages/wakeonlan.md",
          "packages/whois.md",
          "packages/wipe.md",
          "packages/wireshark.md",
          "packages/wondershaper.md",
          "packages/xca.md",
          "packages/xfreerdp.md",
          "packages/xfs_admin.md",
          "packages/xfs_bmap.md",
          "packages/xfs_copy.md",
          "packages/xfs_db.md",
          "packages/xfsdump.md",
          "packages/xfs_estimate.md",
          "packages/xfs_freeze.md",
          "packages/xfs_fsr.md",
          "packages/xfs_growfs.md",
          "packages/xfs_info.md",
          "packages/xfs_io.md",
          "packages/xfs_logprint.md",
          "packages/xfs_mdrestore.md",
          "packages/xfs_metadump.md",
          "packages/xfs_mkfile.md",
          "packages/xfs_ncheck.md",
          "packages/xfs_quota.md",
          "packages/xfs_repair.md",
          "packages/xfsrestore.md",
          "packages/xfs_rtcp.md",
          "packages/xfs_scrub.md",
          "packages/xfs_spaceman.md",
          "packages/xhydra.md",
          "packages/xmount.md",
          "packages/xsensors.md",
          "packages/zbackup.md",
          "packages/zerofree.md",
          "packages/zfs-fuse.md",
          "packages/zfs.md",
          "packages/zip.md",
          "packages/zpool.md",
          "packages/zssh.md",
          "packages/zsync.md"

#: ["",
#	title: ""start with tcp dump"",
     ],
      #],"",
      groups_for_extras: [
     # "SubMenu SysOps": [~r"/ansible", ~r"/docker", ~r"/jmeter", ~r"/kube", ~r"/lxc", ~r"/packer", ~r"/puppet", ~r"/vagrant"],
      "Menu Packages": Path.wildcard("packages/*.md")
   ],

    ],
    ]
  end

  # Run mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
    {:ex_doc, "~> 0.23.0", only: :dev, runtime: false},
    {:earmark, "~> 1.4.13"}
      # {:"dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  # adding custom stylesheet
  defp docs_before_closing_head_tag(:html) do
    ~s{<link rel="stylesheet" href="assets/doc.css">}
  end
  defp docs_before_closing_head_tag(_), do: ""
end
