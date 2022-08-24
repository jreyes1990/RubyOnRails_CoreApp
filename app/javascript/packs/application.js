// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "startbootstrap-sb-admin-2/vendor/jquery/jquery";
import "@popperjs/core/dist/umd/popper";
import "startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle";
import "startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing";
import "startbootstrap-sb-admin-2/js/sb-admin-2";

import "startbootstrap-sb-admin-2/vendor/fontawesome-free/js/all";


document.addEventListener("turbolinks:load", () => {
    /* *******************************************************
      * Para controlar el sidebar en posición cerrado o abierto
      * ******************************************************** */
    let sidebarState = sessionStorage.getItem('sidebar');
    $(".sidebar").toggleClass(sidebarState);

    $("#sidebarToggle, #sidebarToggleTop").on('click', function (e) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
        if ($(".sidebar").hasClass("toggled")) {
            sessionStorage.setItem('sidebar', 'toggled');
            $('.sidebar .collapse').collapse('hide');
        } else {
            sessionStorage.setItem('sidebar', '');
        }
    });

    // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 768px
    if ($(window).width() < 768) {
        $('.sidebar .collapse').collapse('hide');
    }

    // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 480px
    if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
        $("body").addClass("sidebar-toggled");
        $(".sidebar").addClass("toggled");
        $('.sidebar .collapse').collapse('hide');
    }

    if (sidebarState === 'toggled') {
        $(".menu_sb").addClass("collapsed");
        $(".opcion_sb").removeClass("show");
    }
    /* *******************************************************
     * Fin para controlar el sidebar en posición cerrado o abierto
     * ******************************************************** */

    // Configuracion de Scroll Top Button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 40) {
            $('#topBtn').fadeIn();
        } else {
            $('#topBtn').fadeOut();
        }
    });

    $("#topBtn").click(function () {
        $('html ,body').animate({
            scrollTop: 0
        }, 800)
    });


});