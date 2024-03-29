<?php defined( 'ABSPATH' ) OR die( 'This script cannot be accessed directly.' );

/**
 * Theme's widgets
 *
 * @filter us_config_widgets
 */

return array(
	'us_contacts' => array(
		'class' => 'US_Widget_Contacts',
		'name' => '(UpSolution) ' . __( 'Contacts', 'us' ),
		'description' => __( 'Contact Information', 'us' ),
		'params' => array(
			'title' => array(
				'type' => 'textfield',
				'heading' => __( 'Title', 'us' ),
				'std' => __( 'Contacts', 'us' ),
			),
			'address' => array(
				'type' => 'textarea',
				'heading' => __( 'Address', 'us' ),
				'std' => '',
			),
			'phone' => array(
				'type' => 'textarea',
				'heading' => __( 'Phone', 'us' ),
				'std' => '',
			),
			'fax' => array(
				'type' => 'textfield',
				'heading' => __( 'Fax', 'us' ),
				'std' => '',
			),
			'email' => array(
				'type' => 'textfield',
				'heading' => __( 'Email', 'us' ),
				'std' => '',
			),
		),
	),
	'us_login' => array(
		'class' => 'US_Widget_Login',
		'name' => '(UpSolution) ' . __( 'Login', 'us' ),
		'description' => __( 'Login Form', 'us' ),
		'params' => array(
			'title' => array(
				'type' => 'textfield',
				'heading' => __( 'Title', 'us' ),
				'std' => '',
			),
			'register' => array(
				'type' => 'textfield',
				'heading' => __( 'Register URL', 'us' ),
				'std' => '',
			),
			'lostpass' => array(
				'type' => 'textfield',
				'heading' => __( 'Lost Password URL', 'us' ),
				'std' => '',
			),
			'login_redirect' => array(
				'type' => 'textfield',
				'heading' => __( 'Login Redirect URL', 'us' ),
				'std' => '',
			),
			'logout_redirect' => array(
				'type' => 'textfield',
				'heading' => __( 'Logout Redirect URL', 'us' ),
				'std' => '',
			),
		),
	),
	'us_socials' => array(
		'class' => 'US_Widget_Socials',
		'name' => '(UpSolution) ' . __( 'Social Links', 'us' ),
		'description' => __( 'Social Links', 'us' ),
		'params' => array(
			'title' => array(
				'type' => 'textfield',
				'heading' => __( 'Title', 'us' ),
				'std' => '',
			),
			'size' => array(
				'type' => 'dropdown',
				'heading' => __( 'Size', 'us' ),
				'value' => array(
					__( 'Small', 'us' ) => 'small',
					__( 'Medium', 'us' ) => 'medium',
					__( 'Large', 'us' ) => 'large',
				),
				'std' => 'medium',
			),
			'color' => array(
				'type' => 'dropdown',
				'heading' => __( 'Style', 'us' ),
				'value' => array(
					__( 'Colored', 'us' ) => 'colored',
					__( 'Desaturated', 'us' ) => 'desaturated',
				),
				'std' => 'colored',
			),
			'email' => array(
				'type' => 'textfield',
				'heading' => 'Email',
				'std' => '',
			),
			'facebook' => array(
				'type' => 'textfield',
				'heading' => 'Facebook',
				'std' => '',
			),
			'twitter' => array(
				'type' => 'textfield',
				'heading' => 'Twitter',
				'std' => '',
			),
			'google' => array(
				'type' => 'textfield',
				'heading' => 'Google+',
				'std' => '',
			),
			'linkedin' => array(
				'type' => 'textfield',
				'heading' => 'LinkedIn',
				'std' => '',
			),
			'youtube' => array(
				'type' => 'textfield',
				'heading' => 'YouTube',
				'std' => '',
			),
			'vimeo' => array(
				'type' => 'textfield',
				'heading' => 'Vimeo',
				'std' => '',
			),
			'flickr' => array(
				'type' => 'textfield',
				'heading' => 'Flickr',
				'std' => '',
			),
			'instagram' => array(
				'type' => 'textfield',
				'heading' => 'Instagram',
				'std' => '',
			),
			'behance' => array(
				'type' => 'textfield',
				'heading' => 'Behance',
				'std' => '',
			),
			'xing' => array(
				'type' => 'textfield',
				'heading' => 'Xing',
				'std' => '',
			),
			'pinterest' => array(
				'type' => 'textfield',
				'heading' => 'Pinterest',
				'std' => '',
			),
			'skype' => array(
				'type' => 'textfield',
				'heading' => 'Skype',
				'std' => '',
			),
			'tumblr' => array(
				'type' => 'textfield',
				'heading' => 'Tumblr',
				'std' => '',
			),
			'dribbble' => array(
				'type' => 'textfield',
				'heading' => 'Dribbble',
				'std' => '',
			),
			'vk' => array(
				'type' => 'textfield',
				'heading' => 'Vkontakte',
				'std' => '',
			),
			'soundcloud' => array(
				'type' => 'textfield',
				'heading' => 'SoundCloud',
				'std' => '',
			),
			'yelp' => array(
				'type' => 'textfield',
				'heading' => 'Yelp',
				'std' => '',
			),
			'twitch' => array(
				'type' => 'textfield',
				'heading' => 'Twitch',
				'std' => '',
			),
			'deviantart' => array(
				'type' => 'textfield',
				'heading' => 'DeviantArt',
				'std' => '',
			),
			'foursquare' => array(
				'type' => 'textfield',
				'heading' => 'Foursquare',
				'std' => '',
			),
			'github' => array(
				'type' => 'textfield',
				'heading' => 'GitHub',
				'std' => '',
			),
			'odnoklassniki' => array(
				'type' => 'textfield',
				'heading' => 'Odnoklassniki',
				'std' => '',
			),
			's500px' => array(
				'type' => 'textfield',
				'heading' => '500px',
				'std' => '',
			),
			'houzz' => array(
				'type' => 'textfield',
				'heading' => 'Houzz',
				'std' => '',
			),
			'rss' => array(
				'type' => 'textfield',
				'heading' => 'RSS',
				'std' => '',
			),
		),
	),
);
