<!-- partial -->
<div class="main-panel">
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin strech-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">Edit Profile</h4>
                
                <form method="post" action="<?= base_url('admin/ubahProfile/'.$self);?>">
                <input type="hidden" class="form-control" name="id" placeholder="ID" value="<?= $self; ?>" >

                <div class="form-group">
                    <label for="nip">NIM/NIDN</label>
                    <input type="text" class="form-control" name="nip" placeholder="NIM/NIDN" value="<?= $profile['nip']; ?>">
                    <?= form_error('nip', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <div class="form-group">
                    <label for="nama">Nama Lengkap</label>
                    <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama Lengkap" value="<?= $profile['nama']; ?>">
                    <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <div class="form-group">
                <label>Jenis Kelamin</label>
                <select class="form-control" style="width:100%" name="kelamin">
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
                <?= form_error('kelamin', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <div class="form-group row">
                    <div class="col">
                        <label>Status</label>
                        <select class="form-control" name="divisi" id="divisi" style="width:100%">
                        <?php foreach ($divisi as $div) : ?>
                            <option value="<?= $div['id']; ?>"><?= $div['divisi']; ?></option>
                        <?php endforeach; ?>   
                        </select>
                        <?= form_error('divisi', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>

                    <div class="col">
                        <label>Jabatan</label>
                        <select class="form-control" name="jabatan" id="jabatan" style="width:100%"></select>
                        <?= form_error('jabatan', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" placeholder="Email" value="<?= $profile['email']; ?>">
                        <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <div class="col">
                        <label for="telp">No. Telp</label>
                        <input type="text" class="form-control" name="telp" id="telp" placeholder="No. Telp" value="<?= $profile['telp']; ?>">
                        <?= form_error('telp', '<small class="text-danger pl-3">', '</small>'); ?>
                        </DIV>
                </div>

                <button type="submit" class="btn btn-primary">Ubah</button>
                
                <?php if($anyprofile != 0 ) { ?>
                    <a href="<?= base_url('admin/manageUser'); ?>" class="btn btn-light">Batal</a>
                <?php } ?>

                </form>

                
            </div>
        </div>
        </div>
    </div>
    </div>
<!-- content-wrapper ends -->
