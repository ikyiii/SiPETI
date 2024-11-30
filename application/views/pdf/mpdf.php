<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Bukti Permohonan Cuti</title>
</head>

<body>
    <h2 style="text-align: center;">SURAT PERMOHONAN CUTI</h2>
    <p style="text-align: right;">Tanjungpinang, <?= date('d F Y'); ?></p>

    <br><br>
    <p>Surat ini dibuat sebagai dokumen resmi untuk mengajukan permohonan cuti akademik oleh mahasiswa yang bersangkutan. Cuti akademik diberikan berdasarkan ketentuan yang berlaku di lingkungan kampus, sebagai hak mahasiswa untuk tidak mengikuti kegiatan perkuliahan dalam jangka waktu tertentu tanpa kehilangan status sebagai mahasiswa aktif. </p>
    <p>Berikut Data Mahasiswa yang telah mengajukan cuti :  </p>
    <br>
    <table>
        <tbody>
            <tr>
                <td style="width: 190px;">NIM</td>
                <td> : </td>
                <td><?= $cuti['id_nip']; ?></>
            </tr>
            <tr>
                <td style="width: 190px;">Nama Lengkap</td>
                <td> : </td>
                <td><?= $cuti['nama']; ?></>
            </tr>
            <tr>
                <td style="width: 190px;">Status</td>
                <td> : </td>
                <td><?= $cuti['divisi']; ?></>
            </tr>
            <tr>
                <td style="width: 190px;">Jurusan</td>
                <td> : </td>
                <td><?= $cuti['jabatan']; ?></>
            </tr>
            <tr>
                <td style="width: 190px;">Jenis Cuti</td>
                <td> : </td>
                <td><?= $cuti['jenis_cuti']; ?></>
            </tr>
            <tr>
                <td style="width: 190px;">Tanggal Pengajuan</td>
                <td> : </td>
                <td>
                    <?php 
                        $dateORI = substr($cuti['tgl_pengajuan'], 0, 10);
                        $convert = strtotime($dateORI);
                        $dateNEW = date("d F Y", $convert);

                        echo $dateNEW;
                    ?>
                </td>
            </tr>
            <tr>
                <td style="width: 190px;">Keterangan</td>
                <td> : </td>
                <td><?= $cuti['keterangan']; ?></td>
            </tr>
            <tr>
                <td style="width: 190px;">Tanggal Cuti</td>
                <td> : </td>
                <td>
                    <?php 
                        $convertAwal = strtotime($cuti['tgl_awal']);
                        $convertAkhir = strtotime($cuti['tgl_akhir']);

                        $newAwal = date("d F Y", $convertAwal);
                        $newAkhir = date("d F Y", $convertAkhir);

                        echo $newAwal . " s/d " . $newAkhir;       
                    ?>
                </td>
            </tr>

        </tbody>
    </table>

    <br>

    <p>Surat ini merupakan bukti bahwa permohonan cuti oleh saudara/i <?= $cuti['nama']; ?> telah di-<?=$cuti['status']; ?>.</p>
    <p>Demikian surat cuti ini dibuat sebagai dokumen resmi yang menyatakan bahwa mahasiswa yang bersangkutan telah diberikan izin cuti akademik sesuai dengan ketentuan yang berlaku di universitas. Kami berharap mahasiswa dapat memanfaatkan masa cuti ini dengan baik dan kembali aktif sesuai jadwal yang telah ditentukan.</p>
    <br>
    
    <table style="width: 100%; margin-top: 50px;">
    <tr>
        <td style="text-align: left;">
            Tertanda,
            <br><br><br><br><br><br><br>
            <u>Muhammad Ade Rizky</u>
            <br>
            NIP. 2201020093
        </td>
        <td style="text-align: right;">
            Tertanda,
            <br><br><br><br><br><br><br>
            <u>Faalih Aziz Taquyyuddin</u>
            <br>
            NIP. 2201020095
        </td>
    </tr>
</table>


</body>

</html>