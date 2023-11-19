<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/7.3.67/css/materialdesignicons.min.css" integrity="sha512-nRzny9w0V2Y1/APe+iEhKAwGAc+K8QYCw4vJek3zXhdn92HtKt226zHs9id8eUq+uYJKaH2gPyuLcaG/dE5c7A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<?php echo base_url();?>assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<?php echo base_url();?>assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h2 class="card-title text-left mb-3 "><strong>¡Bienvenido! 👋🏻</strong></h2>
                <?php if (!empty($mensaje)): ?>
                      <div class="alert alert-danger" role="alert">
                          <?= $mensaje ?>
                      </div>
                <?php endif; ?>
                <?php echo form_open('');?>
                  <div class="form-group">
                      <label>Correo Electronico</label>
                      <?php
                          $data = [
                              'name'      => 'correo',
                              'value'     => (!empty($correo)) ? $correo : '',
                              'type'      => 'correo',
                              'class'     => 'form-control p_input"', 
                              'placeholder' => 'Ingrese el correo'
                          ];
                          echo form_input($data);
                      ?>   
                  </div>
                  <div class="form-group">
                      <label>Contraseña</label>
                      <?php
                          $data = [
                              'name'      => 'password',
                              'value'     => '',
                              'type'     => 'password',
                              'class'     => 'form-control p_input"', 
                              'placeholder' => 'Ingrese la contraseña'
                          ];
                          echo form_input($data);
                      ?>
                  </div>
                  <div class="mb-2">
                    <a href="#" class="forgot-pass">Recuperar contraseña</a>
                  </div>
                  <?php 
                      $data = array(
                          'name' => 'mysubmit',
                          'id'  =>  'boton',
                          'type' => 'submit',
                          'class' => 'btn btn-primary btn-block enter-btn',
                          'content' => 'INICIAR SESION'
                      );
                      echo form_button($data)
                  ?> 
              <?php echo form_close();?>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="<?php echo base_url();?>assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<?php echo base_url();?>assets/js/off-canvas.js"></script>
    <script src="<?php echo base_url();?>assets/js/hoverable-collapse.js"></script>
    <script src="<?php echo base_url();?>assets/js/misc.js"></script>
    <script src="<?php echo base_url();?>assets/js/settings.js"></script>
    <script src="<?php echo base_url();?>assets/js/todolist.js"></script>
    <!-- endinject -->
  </body>
</html>