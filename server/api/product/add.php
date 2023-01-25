<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/barang.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$barang = new Barang($conn);

$data = json_decode(file_get_contents("php://input"));

$response = [];

if ($request == 'POST') {
    if (
        !empty($data->kd_barang) &&
        !empty($data->nama_barang) &&
        !empty($data->jumlah_barang) &&
        !empty($data->harga_beli) &&
        !empty($data->harga_satuan) &&
        !empty($data->tanggal_masuk)
    ) {
        $barang->kd_barang = $data->kd_barang;
        $barang->nama_barang = $data->name;
        $barang->jumlah_barang = $data->jumlah_barang;
        $barang->harga_beli = $data->harga_beli;
        $barang->harga_satuan = $data->harga_satuan;
        $barang->tanggal_masuk = $data->tanggal_masuk;


        $data = array(
            'kd_barang' => $barang->kd_barang,
            'nama_barang' => $barang->nama_barang,
            'jumlah_barang' => $barang->jumlah_barang,
            'harga_beli' => $barang->harga_beli,
            'harga_satuan' => $barang->harga_satuan,
            'tanggal_masuk' => $barang->tanggal_masuk,

        );

        if ($barang->add()) {
            $response = array(
                'status' =>  array(
                    'messsage' => 'Success', 'code' => (http_response_code(200))
                ), 'data' => $data
            );
        } else {
            http_response_code(400);
            $response = array(
                'messsage' => 'Add Failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' =>  array(
                'messsage' => 'Add Failed - Wrong Parameter', 'code' => http_response_code()
            )
        );
    }
} else {
    http_response_code(405);
    $response = array(
        'status' =>  array(
            'messsage' => 'Method Not Allowed', 'code' => http_response_code()
        )
    );
}

echo json_encode($response);
