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
define('DB_NAME', 'wbs');

/** MySQL database username */
define('DB_USER', 'admin');

/** MySQL database password */
define('DB_PASSWORD', 'admincmg@3f');

/** MySQL hostname */
define('DB_HOST', 'c-mg.vn');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Gu#-M~KS!{7h&=k0S2a(>hqQ{UJ0/-}9PfwrTp@}mv}G)Q@Jrx_wQ6_|;zJ4IJ%0');
define('SECURE_AUTH_KEY',  'so6v^3cA~`$(S7!Q,@K~gX6YmzG~sLv*l~zg@Y6sY}%^ux+l,-8G-6mH.*6#*A&Z');
define('LOGGED_IN_KEY',    'p&/E]`?1A}+~Z# m%,_:H*TT~F%w1Z@G`IXtslqErZ}8-kY{dD%li1[+&BO|A&fE');
define('NONCE_KEY',        'aT@7S3F#`+p_L!/rQ/ZfM5uvcj?[s?3U  XEu?OoLkm=,?|k_@uyQ5|]mNqh-+#~');
define('AUTH_SALT',        '+h-a1/I],F!ld{c5o+,IV?Ky@n Ech?*VRKD&&kjP3RrB}yBzrRGMiT/x%,I&E]t');
define('SECURE_AUTH_SALT', 'pLpE]D pb|O(QxRh|Ev.% d%MK~D:#.j{&++^^<KwmEZoB(c)g/py+?/`pmgQOMv');
define('LOGGED_IN_SALT',   'tAs1[8nXD0/~q3I-;,jJ:q6SS_HES0OtpA5,+3u[+K^5(G:PEU#M8eYZt~Em`$$l');
define('NONCE_SALT',       'V-V-Cb at?]-b-+@LN;+?80MjnsM]CD-Bze6~_)MJS(|PIWbiu,W#@6+xt+3Mze7');

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
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
