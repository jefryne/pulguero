<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo" href="../../index.html"><img src="../../assets/images/logo.svg" alt="logo" /></a>
          <a class="sidebar-brand brand-logo-mini" href="../../index.html"><img src="../../assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <ul class="nav">
          <li class="nav-item profile">
            <div class="profile-desc">
              <div class="profile-pic">
                <div class="count-indicator">
                  <img class="img-xs rounded-circle " src="../../assets/images/faces/face15.jpg" alt="">
                  <span class="count bg-success"></span>
                </div>
                <div class="profile-name">
                  <h5 class="mb-0 font-weight-normal"><?php echo $nombre_usuario; ?></h5>
                  <h5 class="mb-0 font-weight-normal"><?php echo $rol_usuario; ?></h5>
                  <span></span>
                </div>
              </div>
              <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a>
              <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list" aria-labelledby="profile-dropdown">
                <a href="#" class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-dark rounded-circle">
                      <i class="mdi mdi-settings text-primary"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <p class="preview-subject ellipsis mb-1 text-small">Account settings</p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-dark rounded-circle">
                      <i class="mdi mdi-onepassword  text-info"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <p class="preview-subject ellipsis mb-1 text-small">Change Password</p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-dark rounded-circle">
                      <i class="mdi mdi-calendar-today text-success"></i>
                    </div>
                  </div>
                  <div class="preview-item-content">
                    <p class="preview-subject ellipsis mb-1 text-small">To-do list</p>
                  </div>
                </a>
              </div>
            </div>
          </li>
          <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="http://[::1]/pulguero/index.php/Dashboard/dashboard">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#usuarios_nav" aria-expanded="false" aria-controls="usuarios_nav">
              <span class="menu-icon">
                <i class="mdi mdi-table-large"></i>
              </span>
              <span class="menu-title">Usuarios</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="usuarios_nav">
              <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Usuarios/register"> Registrar</a></li>
                <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Usuarios/listadoUsuarios">Lista usuarios</a></li>
                <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Usuarios/crear_cuenta"> Crear cuenta </a></li>
                <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Acumulados/listadoAcumulados"> Acumulados </a></li>

              </ul>
            </div>
          </li>

          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <span class="menu-icon">
                <i class="mdi mdi-table-large"></i>
              </span>
              <span class="menu-title">Inventario</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Inventarios/crearCategoria">Crear categoria</a></li>
                <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Inventarios/listadoInventario"> Listado Inventario </a></li>
                <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Inventarios/inventario"> Crear inventario </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#historial_nav" aria-expanded="false" aria-controls="historial_nav">
              <span class="menu-icon">
                <i class="mdi mdi-table-large"></i>
              </span>
              <span class="menu-title">Historial</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="historial_nav">
              <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="http://[::1]/pulguero/index.php/Historiales/listadoHistorial">Lista Historial</a></li>

              </ul>
            </div>
          </li>
          
        </ul>
      </nav>