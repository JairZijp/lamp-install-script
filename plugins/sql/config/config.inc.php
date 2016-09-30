<?php
/**
 * Debian local configuration file
 *
 * This file overrides the settings made by phpMyAdmin interactive setup
 * utility.
 *
 * For example configuration see
 *   /usr/share/doc/phpmyadmin/examples/config.sample.inc.php
 * or
 *   /usr/share/doc/phpmyadmin/examples/config.manyhosts.inc.php
 */

/**
 * Server(s) configuration
 */
$i = 0;
// The $cfg['Servers'] array starts with $cfg['Servers'][1].  Do not use $cfg['Servers'][0].
// You can disable a server config entry by setting host to ''.
$i++;


/* Configure according to dbconfig-common if enabled */
if (!empty($dbname)) {
    /* Authentication type */
    $cfg['Servers'][$i]['auth_type'] = 'config';
    /* Server parameters */
    if (empty($dbserver)) $dbserver = 'localhost';
    $cfg['Servers'][$i]['host'] = $dbserver;

    if (!empty($dbport) || $dbserver != 'localhost') {
        $cfg['Servers'][$i]['connect_type'] = 'tcp';
        $cfg['Servers'][$i]['port'] = $dbport;
    }
    //$cfg['Servers'][$i]['compress'] = false;
    /* Select mysqli if your server has it */
    $cfg['Servers'][$i]['extension'] = 'mysqli';
    /* Optional: User for advanced features */
    $cfg['Servers'][$i]['controluser'] = $dbuser;
    $cfg['Servers'][$i]['controlpass'] = $dbpass;
    /* Optional: Advanced phpMyAdmin features */
    $cfg['Servers'][$i]['pmadb'] = $dbname;
    $cfg['Servers'][$i]['bookmarktable'] = 'pma_bookmark';
    $cfg['Servers'][$i]['relation'] = 'pma_relation';
    $cfg['Servers'][$i]['table_info'] = 'pma_table_info';
    $cfg['Servers'][$i]['table_coords'] = 'pma_table_coords';
    $cfg['Servers'][$i]['pdf_pages'] = 'pma_pdf_pages';
    $cfg['Servers'][$i]['column_info'] = 'pma_column_info';
    $cfg['Servers'][$i]['history'] = 'pma_history';
    $cfg['Servers'][$i]['designer_coords'] = 'pma_designer_coords';
    $cfg['Servers'][$i]['tracking'] = 'pma_tracking';
    $cfg['Servers'][$i]['userconfig'] = 'pma_userconfig';
    $cfg['Servers'][$i]['user'] = 'root';
    $cfg['Servers'][$i]['password'] = 'lamp';

    $i++;
}

/*
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
