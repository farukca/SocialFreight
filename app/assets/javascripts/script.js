jQuery(document).ready(function() {

jQuery('.portfolio-hover').css({opacity: 0});

jQuery('.portfolio-hover').hover(function(){

    jQuery(this).addClass('current_project');
    jQuery('.current_project').stop().animate({opacity: 1}, 400);

}, function(){

     jQuery('.current_project').stop().animate({opacity: 0}, 300);
     jQuery('.current_project').removeClass('current_project');

});



/* Isotope -------------------------------------*/

	  if( jQuery().isotope ) {

	    jQuery(function() {

            var container = jQuery('.portfolio-items'),
                optionFilter = jQuery('#filters'),
                optionFilterLinks = optionFilter.find('a');

            optionFilterLinks.attr('href', '#');

            optionFilterLinks.click(function(){
                var selector = jQuery(this).attr('data-filter');
                container.isotope({
                    filter : '.' + selector,
                    itemSelector : '.span-one-third',
                    layoutMode : 'masonry',
                    animationEngine : 'best-available'
                });

                // Highlight the correct filter
                optionFilterLinks.removeClass('active');
                jQuery(this).addClass('active');
                return false;
            });

	    });

	}


	
        
    jQuery('.blog-slider').cycle({
            'fx' : 'fade',
            before: before_cycle,
            speed:   400,
            timeout: 0,
            pause:   1,
            'pager' : '#blog-pager'

        });

        jQuery('.sidebar-blog-slider').cycle({
            'fx' : 'fade',
            before: before_cycle,
            speed:   400,
            timeout: 0,
            pause:   1,
            'pager' : '#sidebar-blog-pager'

        });

        // Submenues

                jQuery('ul.sf-menu').superfish();

        jQuery('ul.sf-menu2').superfish();
        
// Sliders

jQuery('.images').cycle({
            fx:     'fade',
            speed:    1500,
            timeout:  1500,
            pager:  '.slider-nav',
            pagerAnchorBuilder: function(idx, slide) {
                // return selector string for existing anchor
                return '.slider-nav li:eq(' + idx + ') a';}
        });

          jQuery('.images-thumb').cycle({
            fx:     'fade',
            speed:    1500,
            timeout:  1500,
            pager:  '.slider-nav-thumbs',
            pagerAnchorBuilder: function(idx, slide) {
                // return selector string for existing anchor
                return '.slider-nav-thumbs li:eq(' + idx + ') a';}
        });

         jQuery('.images-wide').cycle({
            fx:     'fade',
            speed:    1500,
            timeout:  1500,
            pager:  '.slider-nav-wide',
            pagerAnchorBuilder: function(idx, slide) {
                // return selector string for existing anchor
                return '.slider-nav-wide li:eq(' + idx + ') a';}
        });

          jQuery('.images-wide-thumb').cycle({
            fx:     'fade',
            speed:    1500,
            timeout:  1500,
            pager:  '.slider-nav-thumbs',
            pagerAnchorBuilder: function(idx, slide) {
                // return selector string for existing anchor
                return '.slider-nav-thumbs li:eq(' + idx + ') a';}
        });
        
    jQuery('.content-slider').cycle({
            'fx' : 'fade',
            'timeout' : 4000,
            'pager' : '#content-slider-pager',
            'next':   '#next-arrow',
            'pause':   1,
    'prev':   '#prev-arrow'
         });

// Portfolio Slider

        jQuery('.home-portfolio').cycle({
            'fx' : 'scrollHorz',
            'timeout' : 0,
            'pager' : '#portfolio-pager'
        });


  
// Widgets

         jQuery('.testimonials').cycle({
            'fx' : 'fade',
            before: before_cycle,
            speed:   400,
			timeout: 0,
			pause:   1,
            'pager' : '#testimonial-pager'

        });

         jQuery('.sidebar-testimonials').cycle({
            'fx' : 'fade',
            before: before_cycle,
            speed:   400,
			timeout: 0,
			pause:   1,
            'pager' : '#sidebar-testimonial-pager'

        });

        jQuery(".tweet").tweet({
            username: "envato",
            join_text: "",
            count: 2,
            auto_join_text_ed: "",
            auto_join_text_ing: "",
            auto_join_text_reply: "",
            auto_join_text_url: "",
            loading_text: "loading tweets..."
        })

        jQuery(".sidebar-tweet").tweet({
            username: "ddstudios",
            join_text: "",
            count: 3,
            auto_join_text_ed: "",
            auto_join_text_ing: "",
            auto_join_text_reply: "",
            auto_join_text_url: "",
            loading_text: "loading tweets..."
        })

        jQuery('.simple-slider').cycle({
            'before' : before_cycle_simple_slider,
            'fx' : 'fade',

            speed:   600,
            timeout: 4000,
            pause:   1,

            'pager' : '.slider-pagers'
        });


        function before_cycle_simple_slider(curr, next, opts, fwd) {

            var index = opts.currSlide;
            var jQueryht = jQuery(this).outerHeight();
            jQuery(this).parent().animate({
                height: jQueryht
            }, 200);

        }

        jQuery(".alert-message").alert()

  
            jQuery('.tabs').tabs()
    

        function before_cycle(curr, next, opts, fwd) {

            var index = opts.currSlide;
            var jQueryht = jQuery(this).outerHeight();
            jQuery(this).parent().animate({
                height: jQueryht
            }, 200);


        }

jQuery("a[rel^='prettyPhoto']").prettyPhoto();



        
    });
