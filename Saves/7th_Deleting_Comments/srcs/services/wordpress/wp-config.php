<?php
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wordpress' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb.srcs_intra' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
define('AUTHOR', 'yotillar');

// Authentication unique keys and salts.
define( 'AUTH_KEY',         'UK #K!fjLMw=-}:>R]a:E?AB4}vE<Iz-2:b<)g5/b8Dp|ZWp&80K]~ToC`c)S8bq' );
define( 'SECURE_AUTH_KEY',  'Cv0gW{;$YDZt@-JZ:G19G-J6cRa>2s6lEGx/o$-o)iJN[{NoK)8ZNHqQNtkl>:gG' );
define( 'LOGGED_IN_KEY',    'C|p2Vd$Jd@!z_<=s>ID<=8qY+,{|)hq^_~Bn_m}1d[6-;S3V0S7-Ru-]Y-!Uh2d/' );
define( 'NONCE_KEY',        '|VKHG,-3Qp=7+ou%2H~SP1Wbx)3j]?0:sZ5#dww9U-wx@*]5RfmTdhfQk+S9pIDR' );
define( 'AUTH_SALT',        'KfFL8Y4I4yR(u@%82ykJiRsS S?s.;ug+I-K|eG#Y)1b;v~R&Y#RVnm43[-^TyTK' );
define( 'SECURE_AUTH_SALT', 'HnU+v/Mk`J*---B5}zyw{8J+3!VoHVbr2&buZKb-8XaruO`1rzlKZ?!`sYOx>i?!' );
define( 'LOGGED_IN_SALT',   'JR?8((|0A#9}|p:]6_6-Erp}}eBwa8b9wxMP,Ji1F4=R>pGJ&H_>4SPBh<ce?P,H' );
define( 'NONCE_SALT',       'BEtMKH9E0P-ke=%MfJyJNMH6`RYu%9ERN?T++hB[e+|30frC+ 3XQC5X(>gL;]|>' );

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 */

define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );

/* Add any custom values between this line and the "stop editing" line. */
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
