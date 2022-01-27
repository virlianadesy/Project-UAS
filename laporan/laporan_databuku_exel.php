<?php error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));

	$koneksi = new mysqli("localhost","root","","db_perpustakaan");

	$filename = "databuku_exel-(".date('d-m-Y').").xls";

	header("content-disposition: attachment; filename='$filename'");
	header("content-type: application/vdn.ms-exel");

?>

<h2>Laporan Data Buku</h2>

<table border="1">

	<tr>
        <th>No</th>
        <th>Judul</th>
        <th>Pengarang</th>
        <th>Penerbit</th>
        <th>ISBN</th>
        <th>Jumlah Buku</th>
    </tr>

    <?php

        $no = 1;

        $sql = $koneksi-> query ("select * from tb_buku");

        while ($data = $sql->fetch_assoc()) {

    ?>

    <tr> 
    	<td><?php echo $no++; ?></td>
        <td><?php echo $data['judul'];?></td>
        <td><?php echo $data['pengarang'];?></td>
        <td><?php echo $data['penerbit'];?></td>
        <td><?php echo $data['isbn'];?></td>
        <td><?php echo $data['jumlah_buku'];?></td>
        
    </tr>

        <?php } ?>

</table>