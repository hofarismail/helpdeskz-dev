<!DOCTYPE html>
<html lang="en">

<head>

    <title>HelpDeskZ Staff Panel</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Favicon icon -->
    <?php
    echo link_tag('https://getbootstrap.com/docs/5.3/assets/img/favicons/favicon.ico', 'icon', 'image/x-icon') .
        link_tag('assets/components/fontawesome/css/all.min.css') .
        link_tag('assets/components/bootstrap/css/bootstrap.min.css') .
        link_tag('assets/admin/styles/shards-dashboards.1.1.0.css');
    ?>
</head>

<body>
    <!-- [ auth-signin ] start -->
    <div class="container pt-5">
        <div class="card">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="card-body">
                        <!-- <img src="/assets/helpdeskz/images/logo.png" alt="" class="img-fluid mb-4"> -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" class="d-block my-1" viewBox="0 0 118 94" role="img">
                            <title>Bootstrap</title>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z" fill="currentColor"></path>
                        </svg>
                        <h4 class="mb-3 f-w-400"><?php echo lang('Admin.twoFactor.title'); ?></h4>
                        <?php
                        if (isset($error_msg)) {
                            echo '<div class="alert alert-danger">' . $error_msg . '</div>';
                        }
                        echo form_open('', [], [
                            'do' => 'login',
                            'username' => set_value('username', '', false),
                            'password' => set_value('password', '', false),
                            'remember' => set_value('remember', '')
                        ]);
                        ?>
                        <p></p>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                </div>
                                <input type="text" name="two_factor" class="form-control" placeholder="<?php echo lang('Admin.twoFactor.verificationCode'); ?>" autocomplete="off">
                            </div>
                            <small class="form-text text-muted"><?php echo lang('Admin.twoFactor.enter2FA'); ?></small>
                        </div>
                        <button class="btn btn-primary"><?php echo lang('Admin.login.button'); ?></button>
                        <a href="<?php echo site_url(route_to('staff_login')); ?>" class="btn btn-danger"><?php echo lang('Admin.form.cancel'); ?></a>
                        <?php
                        echo form_close();
                        ?>
                    </div>
                </div>
                <div class="col-md-6 d-none d-md-block">
                    <img src="<?php echo base_url('assets/helpdeskz/images/desk.jpg'); ?>" alt="" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
    <!-- [ auth-signin ] end -->

    <!-- Required Js -->
    <?php
    echo script_tag('assets/admin/js/vendor-all.min.js') .
        script_tag('assets/admin/plugins/bootstrap/js/bootstrap.min.js');
    ?>
</body>

</html>