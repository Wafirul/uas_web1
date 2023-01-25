<?php
class Barang
{
    public $kd_barang;
    public $nama_barang;
    public $jumlah_barang;
    public $harga_beli;
    public $harga_satuan;
    public $tanggal_masuk;


    private $conn;
    private $table = "tbl_barang";

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    function add()
    {
        $query = "INSERT INTO
                " . $this->table . "
            SET
               kd_barang=:kd_barang, nama_barang=:nama_barang, jumlah_barang=:jumlah_barang, harga_beli=:harga_beli, harga_satuan=:harga_satuan, tanggal_masuk=:tanggal_masuk";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('kd_barang', $this->kd_barang);
        $stmt->bindParam('nama_barang', $this->nama_barang);
        $stmt->bindParam('jumlah_barang', $this->jumlah_barang);
        $stmt->bindParam('harga_beli', $this->harga_beli);
        $stmt->bindParam('harga_satuan', $this->harga_satuan);
        $stmt->bindParam('tanggal_masuk', $this->tanggal_masuk);


        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE kd_barang = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->kd_barang);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function fetch()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function get()
    {
        $query = "SELECT * FROM " . $this->table . " p          
                WHERE
                    p.kd_barang = ?
                LIMIT
                0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->kd_barang);

        $stmt->execute();

        $product = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->kd_barang = $product['kd_barang'];
        $this->nama_barang = $product['nama_barang'];
        $this->jumlah_barang = $product['jumlah_barang'];
        $this->harga_beli = $product['harga_beli'];
        $this->harga_satuan = $product['harga_satuan'];
        $this->tanggal_masuk = $product['idtanggal_masuk'];
    }

    function update()
    {
        $query = "UPDATE
                " . $this->table . "
            SET
            nama_barang = :nama_barang,
             jumlah_barang = :jumlah_barang,
              harga_beli = :harga_beli, 
              harga_satuan = :harga_satuan, 
              tanggal_masuk = :tanggal_masuk
            WHERE
                kd_barang = :kd_barang";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('kd_barang', $this->kd_barang);
        $stmt->bindParam('nama_barang', $this->nama_barang);
        $stmt->bindParam('jumlah_barang', $this->jumlah_barang);
        $stmt->bindParam('harga_beli', $this->harga_beli);
        $stmt->bindParam('harga_satuan', $this->harga_satuan);
        $stmt->bindParam('tanggal_masuk', $this->tanggal_masuk);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}
