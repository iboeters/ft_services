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
define('DB_HOST', 'mysql-service');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('WP_DEBUG', true);

define('WP_DEBUG_LOG', true);

// define('WP_HOME', 'http://${WORDPRESS_SVC_SERVICE_HOST}:${WORDPRESS_SVC_SERVICE_PORT}' );
// define('WP_SITEURL', 'http://${WORDPRESS_SVC_SERVICE_HOST}:${WORDPRESS_SVC_SERVICE_PORT}' );
define('WP_HOME', 'http://192.168.99.221:5050');
define('WP_SITEURL', 'http://192.168.99.221:5050');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '~2.*L)E3*CRCTvxH}{JGWLbb=i]|HOR;rzt?8PQs@q>=DQ.I|dYHa`SX/2JOtLcz');
define('SECURE_AUTH_KEY',  '7N:MRIR`NUNgduJW&c<.r0Q>kWw,vd>Qd?!NA|tF<D?^|$t#a(R>rYqD~7~xw[a1');
define('LOGGED_IN_KEY',    'ex1$}Uyf-jH42ujxvb:/(M@15C|g1fd{bF<O%SO;qdW~:?PU+rvDQB|Vs?rD,fap');
define('NONCE_KEY',        'uu*AenlY`e8SgYp}PaWFCbx?X)vS$S@+=}OS?iB-(9gF|; .o-F$:vrA:w?a$q<1');
define('AUTH_SALT',        'o$X../6b|9w3(HRPNGE#0[CLua#x!Oy%--k.9`.O%+1hc4T.Ps0)jQ}7?I-Hiw54');
define('SECURE_AUTH_SALT', 'C-,KXL=Sd&?~8fetT|_E:]<t)iNPUgr:+=W| ]?2|VM.x+^?do-Y`OARV~2-P[!g');
define('LOGGED_IN_SALT',   'Z0)T 40i&[z,v<_=v<kAE:LkIDbn/^mDG]-*;tqR*,^OpVr9k]-]VdjP+:6ck?O(');
define('NONCE_SALT',       'FB4Pi|]WL*!S=<LC|/s+X-nYHnM/Uo(j[_aXT/7=Pa,_Hj^1GLy:A{r-&LmCP6!a');

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
