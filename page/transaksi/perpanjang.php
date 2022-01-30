<!-- page perpanjang buku -->
<?php

	$id = $_GET['id'];
	$judul = $_GET['judul'];
	$tgl_kembali = $_GET['tgl_kembali'];
	$lambat = $_GET['lambat'];

	if ($lambat >= 7) {
		?>
			<script type="text/javascript">
				alert("Tidak Dapat Diperpanjang Karena Sudah Lebih Dari 7 Hari, Kembalikan Terlebih Dahulu Baru Kemudian Pijam Kembali!");
				window.location.href="?page=transaksi";
			</script>
		<?php
	}else{
		$pecah_tgl_kembali = explode("-", $tgl_kembali);
		$next_7_hari = mktime(0,0,0, $pecah_tgl_kembali[1], $pecah_tgl_kembali[0]+7, $pecah_tgl_kembali[2]);
		$hari_next = date("d-m-y", $next_7_hari);

		$sql = $koneksi->query("update tb_transaksi set tgl_kembali='$hari_next' where id='$id' ");

		if ($sql) {
			?>
				<script type="text/javascript">
					alert("Buku Berhasil Diperpanjang");
					window.location.href="?page=transaksi";
				</script>
			<?php
		}else{
			?>
				<script type="text/javascript">
					alert("Buku Gagal Diperpanjang");
					window.location.href="?page=transaksi";
				</script>
			<?php
		}
	}

?>