<!-- page ubah buku -->
<?php

	$id = $_GET['id'];

	$sql = $koneksi->query("select * from tb_buku where id='$id'");

	$tampil = $sql->fetch_assoc();

	$tahun2 = $tampil['tahun_terbit'];

?>

<div class="panel panel-default">
    <div class="panel-heading">
		Edit Data
	</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12">                   
                <form method="POST">
                    <div class="form-group">
                        <label>Judul</label>
                        <input class="form-control" name="judul" value="<?php echo $tampil['judul']; ?>" />
                    </div>

                    <div class="form-group">
                        <label>Pengarang</label>
                        <input class="form-control" name="pengarang" value="<?php echo $tampil['pengarang']; ?>" />
                    </div>

                    <div class="form-group">
                        <label>Penerbit</label>
                        <input class="form-control" name="penerbit" value="<?php echo $tampil['penerbit']; ?>" />
                    </div>

                    <div class="form-group">
                        <label>Tahun Terbit</label>
                        <select class="form-control" name="tahun">
                                                
                            <?php

                                $tahun = date("Y");
                                for ($i=$tahun-32; $i <= $tahun; $i++) { 
                                            		
                                    if($i == $tahun2){

                                        echo'<option value="'.$i.'" selected>'.$i.'</option>';

                                    }else{

                                        echo'<option value="'.$i.'">'.$i.'</option>';
                                    }        		
                                            	
                                }

                            ?>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>ISBN</label>
                        <input class="form-control" name="isbn" value="<?php echo $tampil['isbn']; ?>" />
                    </div>

                    <div class="form-group">
                        <label>Jumlah Buku</label>
                        <input class="form-control" type="number" name="jumlah" value="<?php echo $tampil['jumlah_buku']; ?>" />
                    </div>

                    <div class="form-group">
                        <label>Tanggal Input</label>
                        <input class="form-control" name="tanggal" type="date" value="<?php echo $tampil['tgl_input']; ?>" />
                    </div>

                    <div> 
                        <input type="submit" name="simpan" value="ubah" class="btn btn-primary">
                    </div>             
                </form>
            </div>
        </div>
    </div>
</div>

<?php

	$judul = $_POST ['judul'];
	$pengarang = $_POST ['pengarang'];
	$penerbit = $_POST ['penerbit'];
	$tahun = $_POST ['tahun'];
	$isbn = $_POST ['isbn'];
	$jumlah = $_POST ['jumlah'];
	$tanggal = $_POST ['tanggal'];
	$simpan = $_POST ['simpan'];

	if ($simpan) {
		

		$sql = $koneksi->query("update tb_buku set judul='$judul', pengarang='$pengarang', penerbit='$penerbit', tahun_terbit='$tahun', isbn='$isbn', jumlah_buku='$jumlah',  tgl_input='$tanggal' where id='$id' ");

		if ($sql) {
			

			?>
				<script type="text/javascript">
					alert ("Data Berhasil Diubah");
					window.location.href="?page=buku";
				</script>
			<?php

		}

	}

?>
