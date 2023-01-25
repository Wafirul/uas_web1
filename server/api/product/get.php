<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/barang.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$barang = new Barang($conn);
$barang->kd_barang = isset($_GET['kd_barang']) ? $_GET['kd_barang'] : die();

$barang->get();

$response = [];

if ($request == 'GET') {
    if ($barang->kd_barang != null) {
        $data = array(
            'kd_barang' => $barang->kd_barang,
            'nama_barang' => $barang->nama_barang,
            'jumlah_barang' => $barang->jumlah_barang,
            'harga_beli' => $barang->harga_beli,
            'harga_satuan' => $barang->harga_satuan,
            'tanggal_masuk' => $barang->tanggal_masuk,
        );
        $response = array(
            'status' =>  array(
                'messsage' => 'Success', 'code' => (http_response_code(200))
            ), 'data' => $data
        );
    } else {
        http_response_code(404);
        $response = array(
            'status' =>  array(
                'messsage' => 'No Data Found', 'code' => http_response_code()
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
