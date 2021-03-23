<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'mysql');

/** MySQL database password */
define('DB_PASSWORD', 'password');

/** MySQL hostname */
define('WORDPRESS_DB_HOST', 'mysql-service');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

// define('WP_HOME', 'http://${WORDPRESS_SVC_SERVICE_HOST}:${WORDPRESS_SVC_SERVICE_PORT}' );
// define('WP_SITEURL', 'http://${WORDPRESS_SVC_SERVICE_HOST}:${WORDPRESS_SVC_SERVICE_PORT}' );
define('WP_HOME', 'http://192.168.99.220:5050' );
define('WP_SITEURL', 'http://192.168.99.220:5050' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ' R|`xH<2{aPX0m>+LYGNk;m:qzZqmj>R%S|6tI5H~`hV4w;voh]}E/Qgf=J}/nQC');
define('SECURE_AUTH_KEY',  'j5Dgc`y)oxJ9iKm[*5oL!w]%C)-#by{|jmW!a93aU8rvA8Z7j$|-UN_Hl1#i$`9d');
define('LOGGED_IN_KEY',    '+e!+yW(6I6|&U*QZ`+ uPywV-lz4x{yH&|IJ+/9I nNb{~%$%AR6U+eWT<6jqLX$');
define('NONCE_KEY',        '5p#A|8G-)D9p3=DA1+?a%tJAA++}bsFXM A3e95J+H^%w[ R4p5 =@{(>6ca1*!K');
define('AUTH_SALT',        'yG0dtC*CYjX-g?Zuo_s=964=|)-qhr0+TOd$h[vRY|2wkHH{{eu,!^XDq}PMu^X~');
define('SECURE_AUTH_SALT', '.b^,P4<d1DkB(A%yJvHA9?1DQm8~=]</I.1B<U/ErX3DDg+P|:H>)v92_wtg<l:z');
define('LOGGED_IN_SALT',   'PN8?i9mS!<tTqQD]Qk`nXB{J}Lyh)n~VKKR|jAW)s7T}z|=nahpf>@~7X8^T,Ad-');
define('NONCE_SALT',       '|Hv/C4~iEGYdQ-JNoHZ{N4&i)>q=lmP]7T|~-YE<c_H2z:DG@+]j@?,mnh^+L>$U');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */

define( 'WP_DEBUG_LOG', '/tmp/wp-errors.log' );

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
