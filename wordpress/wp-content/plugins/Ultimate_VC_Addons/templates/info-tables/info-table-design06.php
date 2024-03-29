<?php
/*
* Add-on Name: Info Tables for Visual Composer
* Template : Design layout 06
*/
if(!function_exists('ult_info_table_generate_design06')) {
	function ult_info_table_generate_design06($atts,$content = null){
		$icon_type = $icon_img = $img_width = $icon = $icon_color = $icon_color_bg = $icon_size = $icon_style = $icon_border_style = $icon_border_radius = $icon_color_border = $icon_border_size = $icon_border_spacing = $el_class = $package_heading = $package_sub_heading = $package_price = $package_unit = $package_btn_text = $package_link = $package_featured = $color_bg_main = $color_txt_main = $color_bg_highlight = $color_txt_highlight = $color_scheme = $use_cta_btn = '';
		extract(shortcode_atts(array(
			'color_scheme' => 'black',
			'package_heading' => '',
			'package_sub_heading' => '',
			'icon_type' => 'none',
			'icon' => '',
			'icon_img' => '',
			'img_width' => '48',
			'icon_size' => '32',
			'icon_color' => '#333333',
			'icon_style' => 'none',
			'icon_color_bg' => '#ffffff',
			'icon_color_border' => '#333333',
			'icon_border_style' => '',
			'icon_border_size' => '1',
			'icon_border_radius' => '500',
			'icon_border_spacing' => '50 ',
			'use_cta_btn' => '',
			'package_btn_text' => '',
			'package_link' => '',
			'package_featured' => '',
			'color_bg_main' => '',
			'color_txt_main' => '',
			'color_bg_highlight' => '',
			'color_txt_highlight' => '',
			'heading_font_family' => '',
			'heading_font_style' => '',
			'heading_font_size' => '',
			'heading_font_color' => '',
			'heading_line_height' => '',
			'subheading_font_family' => '',
			'subheading_font_style' => '',
			'subheading_font_size' => '',
			'subheading_font_color' => '',
			'subheading_line_height' => '',
			'features_font_family' => '',
			'features_font_style' => '',
			'features_font_size' => '',
			'features_font_color' => '',
			'features_line_height' => '',
			'button_font_family' => '',
			'button_font_style' => '',
			'button_font_size' => '',
			'button_font_color' => '',
			'button_line_height' => '',
			'el_class' => '',
			'features_min_ht'=>'',

		),$atts));
		$output = $link = $target = $featured = $featured_style = $normal_style = $dynamic_style = $box_icon = '';
		if($icon_type !== "none"){
			$box_icon = do_shortcode('[just_icon icon_type="'.$icon_type.'" icon="'.$icon.'" icon_img="'.$icon_img.'" img_width="'.$img_width.'" icon_size="'.$icon_size.'" icon_color="'.$icon_color.'" icon_style="'.$icon_style.'" icon_color_bg="'.$icon_color_bg.'" icon_color_border="'.$icon_color_border.'"  icon_border_style="'.$icon_border_style.'" icon_border_size="'.$icon_border_size.'" icon_border_radius="'.$icon_border_radius.'" icon_border_spacing="'.$icon_border_spacing.'"]');
		}
		if($color_scheme == "custom"){
			if($color_bg_main !== ""){
				$normal_style .= 'background:'.$color_bg_main.';';
			}
			if($color_txt_main !== ""){
				$normal_style .= 'color:'.$color_txt_main.';';
			}
			if($color_bg_highlight!== ""){
				$featured_style .= 'background:'.$color_bg_highlight.';';
			}
			if($color_txt_highlight !== ""){
				$featured_style .= 'color:'.$color_txt_highlight.';';
			}
		}
		if($package_link !== ""){
			$link = vc_build_link($package_link);
			if(isset($link['target'])){
				$target = 'target="'.$link['target'].'"';
			} else {
				$target = '';
			}
			$link = $link['url'];
		} else {
			$link = "#";
		}
		if($package_featured !== ""){
			$featured = "ult_featured";
		}
		if($use_cta_btn == "box"){
			$output .= '<a href="'.$link.'" '.$target.' class="ult_price_action_button">'.$package_btn_text;
		}

		/* typography */

		$heading_style_inline = $sub_heading_inline = $features_inline = $button_inline = '';

		// heading
		if($heading_font_family != '')
		{
			$hdfont_family = get_ultimate_font_family($heading_font_family);
			if($hdfont_family !== '')
				$heading_style_inline .= 'font-family:\''.$hdfont_family.'\';';
		}

		$heading_style_inline .= get_ultimate_font_style($heading_font_style);

		if($heading_font_size != '')
			$heading_style_inline .= 'font-size:'.$heading_font_size.'px;';

		if($heading_font_color != '')
			$heading_style_inline .= 'color:'.$heading_font_color.';';

		if($heading_line_height != '')
			$heading_style_inline .= 'line-height:'.$heading_line_height.'px;';

		// sub heading
		if($subheading_font_family != '')
		{
			$shfont_family = get_ultimate_font_family($subheading_font_family);
			if($shfont_family !== '')
				$sub_heading_inline .= 'font-family:\''.$shfont_family.'\';';
		}

		$sub_heading_inline .= get_ultimate_font_style($subheading_font_style);

		if($subheading_font_size != '')
			$sub_heading_inline .= 'font-size:'.$subheading_font_size.'px;';

		if($subheading_font_color != '')
			$sub_heading_inline .= 'color:'.$subheading_font_color.';';

		if($subheading_line_height != '')
			$sub_heading_inline .= 'line-height:'.$subheading_line_height.'px;';

		// features
		if($features_font_family != '')
		{
			$featuresfont_family = get_ultimate_font_family($features_font_family);
			if($featuresfont_family !== '')
				$features_inline .= 'font-family:\''.$featuresfont_family.'\';';
		}

		$features_inline .= get_ultimate_font_style($features_font_style);

		if($features_font_size != '')
			$features_inline .= 'font-size:'.$features_font_size.'px;';

		if($features_font_color != '')
			$features_inline .= 'color:'.$features_font_color.';';

		if($features_line_height != '')
			$features_inline .= 'line-height:'.$features_line_height.'px;';

		/*---min ht style---*/
		$info_tab_ht='';$info_tab_ht_style='';
		if($features_min_ht !== ""){
			    $info_tab_ht='info_min_ht';
				$info_tab_ht_style .= 'min-height:'.$features_min_ht.'px;';
			}

		// button
		if($button_font_family != '')
		{
			$buttonfont_family = get_ultimate_font_family($button_font_family);
			if($buttonfont_family !== '')
				$button_inline .= 'font-family:\''.$buttonfont_family.'\';';
		}

		$button_inline .= get_ultimate_font_style($button_font_style);

		if($button_font_size != '')
			$button_inline .= 'font-size:'.$button_font_size.'px;';

		if($button_font_color != '')
			$button_inline .= 'color:'.$button_font_color.';';

		if($button_line_height != '')
			$button_inline .= 'line-height:'.$button_line_height.'px;';

		$output .= '<div class="ult_pricing_table_wrap ult_info_table ult_design_6 '.$featured.' ult-cs-'.$color_scheme.' '.$el_class.'">
					<div class="ult_pricing_table '.$info_tab_ht.'" style="'.$normal_style.' '.$info_tab_ht_style.'">';
			$output .= '<div class="ult_pricing_heading" style="'.$featured_style.'">
							<h3 style="'.$heading_style_inline.'">'.$package_heading.'</h3>';
						if($package_sub_heading !== ''){
							$output .= '<h5 style="'.$sub_heading_inline.'">'.$package_sub_heading.'</h5>';
						}
			$output .= '</div><!--ult_pricing_heading-->';
			if(isset($box_icon) && $box_icon != '') :
			$output .= '<div class="ult_price_body_block" style="'.$featured_style.'">
							<div class="ult_price_body">
								<div class="ult_price">
									'.$box_icon.'
								</div>
							</div>
						</div><!--ult_price_body_block-->';
			endif;
			$output .= '<div class="ult_price_features" style="'.$features_inline.'">
							'.wpb_js_remove_wpautop(do_shortcode($content), true).'
						</div><!--ult_price_features-->';
			if($use_cta_btn == "true"){
				$output .= '<div class="ult_price_link" style="'.$normal_style.'">
							<a href="'.$link.'" '.$target.' class="ult_price_action_button" style="'.$featured_style.' '.$button_inline.'">'.$package_btn_text.'</a>
						</div><!--ult_price_link-->';
			}
			$output .= '<div class="ult_clr"></div>
			</div><!--pricing_table-->
		</div><!--pricing_table_wrap-->';
		if($use_cta_btn == "box"){
			$output .= '</a>';
		}
		return $output;
	}
}
